import 'package:coyote/display_port.dart';
import 'package:flutter/material.dart';
import 'package:coyote/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:coyote/MQTTManager.dart';

late var receiveddevicesjson;
late Map<String, String> mapfordevices = {"x": "y"};

// int newnumber=0;
// int iffolderexistsnumber=0;
// int finalportnumber=0;

// Future<void> createAlbum(String uid) async {
//   final response = await http.post(
//     Uri.parse('http://172.104.206.232/test'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'uid': uid,
//     }),
//   );

//   if (response.statusCode == 200) {
   
//     var abcd = jsonDecode(response.body);
//     int portabcd = abcd['port'];
//     String uidabcd = abcd['uid'];
//     print(portabcd);
//     print(uidabcd);
//     newnumber = portabcd;
//     finalportnumber=newnumber;
//     print("global port number is $newnumber");
    
    

//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//    // return Album.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create album.');
//   }
// }

class GetPort extends StatefulWidget {
  const GetPort({super.key});

  @override
  State<GetPort> createState() => _GetPortState();
}

class _GetPortState extends State<GetPort> {

  MQTTClientManager mqttClientManager = MQTTClientManager();
  //final String pubTopic = "test/counter";
 // final String topic = "test";
  final String tosenddata = "devices/request";
  final String toreceivedata = "devices/response";
  final String datatosend="getdevices";
   List<String> listofdevices = ['D1'];

      
  Widget _title() {
    return const Text('COYOTE', style: TextStyle(color: Colors.white, fontFamily: 'OCR'),);
  }


  @override
  void initState() {
    print(finalportnumber);
     setupMqttClient();
    setupUpdatesListener();
   // killme();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(209, 27, 26, 26),
       appBar: AppBar(
        title: _title(),
        backgroundColor: Color.fromARGB(255, 238, 48, 83),

        actions: <Widget>[
    Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: GestureDetector(
        onTap: () {
          AuthService().signOut();
        },
        child: Icon(
          Icons.logout_outlined,
          size: 26.0,
          color: Colors.white,
        ),
      )
    ),
        ],
      ),
      body: Column(
       
        children: [

          SizedBox(height: 40,),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text('Configure the device of your choices', style: TextStyle(color: Colors.white,fontFamily: 'RobotoMono', fontSize: 20, fontWeight: FontWeight.w700),),

                SizedBox(height: 30,),

                Text('Your port number is: $finalportnumber', style: TextStyle(color: Colors.white,fontFamily: 'RobotoMono'),),

                 SizedBox(height: 20,),

                Text('1) Download the arduino IDE on your desktop', style: TextStyle(color: Colors.white,fontFamily: 'RobotoMono'),),
                SizedBox(height: 15,),

                Text('2) Download the device configuration code on your desktop through github', style: TextStyle(color: Colors.white,fontFamily: 'RobotoMono'),),
                SizedBox(height: 15,),
                Text('3) Open the arduino IDE, change port number and wifi details in the code', style: TextStyle(color: Colors.white,fontFamily: 'RobotoMono'),),
                SizedBox(height: 15,),
                Text('4) Upload the code to device', style: TextStyle(color: Colors.white,fontFamily: 'RobotoMono'),),
                SizedBox(height: 60,),

                 ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 238, 48, 83),),
                onPressed: () {
                Navigator.pushNamed(context, 'getdevices');
              }, child: Text('Proceed', style: TextStyle(color: Colors.white),)),
              ],
            ),
          ),

          
            
        ],
      ),
    );
  }

   

// killme()  {
//   var docRef = FirebaseFirestore.instance.collection("setport").doc(FirebaseAuth.instance.currentUser!.uid);
// docRef.get().then((DocumentSnapshot doc) async {
//     if(doc.exists){
//         print("doc exists");
// //         var collection = FirebaseFirestore.instance.collection('users');
// // var docSnapshot =  collection.doc('doc_id').get();
// // if (docSnapshot.exists) {
//   Map<String, dynamic> datafrominternet = doc.data() as Map<String, dynamic>;
//   iffolderexistsnumber=datafrominternet['port'];  
//   finalportnumber=iffolderexistsnumber;
//   print("data from internet port number: $iffolderexistsnumber");
 
//   //var value = data['port']; // <-- The value you want to retrieve. 
//   // Call setState if needed.
// }
    

//     else{
//       print("doc does not exist");
//       await createAlbum(FirebaseAuth.instance.currentUser!.uid);
//       checkport(newnumber);
//       print("I have reach checkport function");
  
//   // final docUser = FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid);
//   // final json = {
//   //   'port': globalportnumber,
//   // };

//   //  docUser.set(json);
//   //     print("global port number: $globalportnumber");
     

//       //  _futureAlbum = createAlbum(FirebaseAuth.instance.currentUser!.uid);
       
//       //   if(_futureAlbum != null)
//       //   {
//       //     print('Building future builder');
//       //     buildFutureBuilder();
//       //   }

//         //else{
//         //   print("_futureAlbum is null");
//         // }

//     }
  
//   },
//   onError: (e) => print("Error getting document: $e"),
// );
//   }

  
//   void checkport(int integer) async {
//     print("I have reach checkport function");
  
//   final docUser = FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid);
//   final json = {
//     'port': integer,
//   };

//   await docUser.set(json);
//   }





  functiontosendmessage() {
    mqttClientManager.publishMessage( tosenddata, datatosend);
    // setupUpdatesListener();
  }

    Future<void> setupMqttClient() async {
    await mqttClientManager.connect();
    // mqttClientManager.subscribe(topic);
    mqttClientManager.subscribe(toreceivedata);
  }

   setupUpdatesListener()  {
    mqttClientManager
        .getMessagesStream()!
        .listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('MQTTClient::Message received on topic: <${c[0].topic}> is $pt\n');
      receiveddevicesjson = pt;
      
      DecodeJson();
    });
  }

  void DecodeJson(){
    List<dynamic> list = json.decode(receiveddevicesjson);
    for(int i=0; i<list.length; i++){
    String x=list[i]['devid'];
    String y =  list[i]['devtopic'];
    mapfordevices.addEntries([MapEntry(x, y)]);

    listofdevices.add(x);

    }
    mapfordevices.remove("x");
    print(mapfordevices);
    // abcd.add(mapfordevices.keys);
    // print("list: $abcd");
    // print("list[0]: ${abcd[0]}");
    // print(mapfordevices.keys);
   
   // print(list.asMap());
  //   print(list[0]);

    // for(int i=0; i<list.length; i++){
    //   mapfordevices.addAll(json['devid'], json['devtopic']);
    // }
  }

  @override
  void dispose() {
    mqttClientManager.disconnect();
    super.dispose();
  }

}