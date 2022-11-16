import 'dart:convert';


import 'package:coyote/ask_to_proceed.dart';
import 'package:coyote/card_display.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:coyote/MQTTManager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getwidget/getwidget.dart';
import 'package:coyote/get_devices.dart';
import 'package:coyote/get_port.dart';

//late bool exist;


// class Device {
//   String deviceid;
//   String devicetopic;

//   Device(this.deviceid, this.devicetopic);

// }



// class Album {
//   final int port;
//   final String uid;

//   const Album({required this.port, required this.uid});

//   factory Album.fromJson(Map<String, dynamic> json) {
//      Album(
//       port: json['port'],
//       uid: json['uid'],
      
//     );

//     return Album(
//       port: json['port'],
//       uid: json['uid'],
//     );


//   }
// }



class Configure extends StatefulWidget {
  const Configure({super.key});

  @override
  State<Configure> createState() => _ConfigureState();
}

class _ConfigureState extends State<Configure> {
  final TextEditingController _controller = TextEditingController();
  //Future<Album>? _futureAlbum;

  MQTTClientManager mqttClientManager = MQTTClientManager();
  //final String pubTopic = "test/counter";
 // final String topic = "test";
  final String tosenddata = "devices/request";
  final String toreceivedata = "devices/response";
  final String datatosend="getdevices";




  // final url = "http://172.104.206.232/devices";

  // var _postsJson = [];

  // void fetchPosts() async {

  //   try {
  //   final response = await get(Uri.parse(url));
  //   final jsonData = jsonDecode(response.body) as List;

  //   setState(() {
  //     _postsJson = jsonData;
  //   });
  //   } 
    
  //   catch(err){
  //     print('error occured');
  //   }

  // }

  @override
  void initState() {
    // createAlbum(FirebaseAuth.instance.currentUser!.uid);
    setupMqttClient();
    setupUpdatesListener();
   

    // TODO: implement initState
    super.initState();
    //fetchPosts();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    List<String> listofdevices = ['D1', 'D2', 'D3', 'D4'];
    List listofseleceddevices=[];
    String indexes;
  //  final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('setport').snapshots();



    return Scaffold(
      backgroundColor: Color.fromARGB(209, 27, 26, 26),
      body: Column(
        children: [

          
          // Text('Welcome to configure page', style: TextStyle(color: Colors.white),),

          SizedBox(height: 10,),

          // functiontosendmessage(),
          // setupUpdatesListener(),


//            Container(
//   child: GFMultiSelect(
//     items: listofdevices,  // will be displayed in realtime
//     onSelect: (value) {
//       indexes=value.toString();
//       print("indexes: $indexes");
//      // int parsing = int.parse(indexes);
//     //  print("pasing: $parsing");
//       print('selected $value ');
//       listofseleceddevices=value;
//      // listofseleceddevices.add(listofdevices.elementAt(parsing));
//       print(listofseleceddevices);
//       print(listofseleceddevices[0]);
//      // String modify = listofseleceddevices[0].toString();
//      for(int i=0; i<listofseleceddevices.length; i++){
//       print(listofdevices[listofseleceddevices[i]]);    // devices have been accessed
//      }

//       for(int i=0; i<listofseleceddevices.length; i++){
//         globaldevicelist.add(listofdevices[listofseleceddevices[i]]);    // devices have been accessed
//      }

//     },
//     dropdownTitleTileText: 'Choose Devices',
//     dropdownTitleTileColor: Colors.white,
//     dropdownTitleTileMargin: EdgeInsets.only(
//         top: 22, left: 18, right: 18, bottom: 5),
//     dropdownTitleTilePadding: EdgeInsets.all(10),
//     dropdownUnderlineBorder: const BorderSide(
//         color: Colors.transparent, width: 2),
//     dropdownTitleTileBorder:
//     Border.all(color: Colors.grey, width: 1),
//     dropdownTitleTileBorderRadius: BorderRadius.circular(5),
//     expandedIcon: const Icon(
//       Icons.keyboard_arrow_down,
//       color: Colors.black54,
//     ),
//     collapsedIcon: const Icon(
//       Icons.keyboard_arrow_up,
//       color: Colors.black54,
//     ),
//     submitButton: MaterialButton(
//       child: Text('OK', style: TextStyle( color: Colors.white),), onPressed: () async {
//         final docUser = FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid).collection('Devices').doc('selected_devices');
//         for(int i =0; i<listofseleceddevices.length; i++){
//   final json = {
//     'device$i': listofdevices[listofseleceddevices[i]],
//   };

//   await docUser.set(json,SetOptions(merge: true));
//         }
//         print("devices sent on firestore");

//         functiontosendmessage();
//         print('send message function done');
          
//       },
//       ) ,
//     dropdownTitleTileTextStyle: const TextStyle(
//         fontSize: 14, color: Colors.black54),
//     padding: const EdgeInsets.all(6),
//     margin: const EdgeInsets.all(6),
//     type: GFCheckboxType.basic,
//     activeBgColor: Color.fromARGB(255, 238, 48, 83),
//     inactiveBorderColor: Colors.grey,
//   ),
// ),

 ListView.builder(
   scrollDirection: Axis.vertical,
    shrinkWrap: true,
  
            itemCount: globaldevicelist.length,
  
            itemBuilder: (context, position) {
  
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Container(
                  decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
           color: Color.fromARGB(255, 245, 245, 245),
                  ),
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                 
  
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
  
  
  
                     Text(
  
                      globaldevicelist[position],
  
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
  
                    ),
  
  
  
                    SizedBox(width: 10,),
  
  
  
                    GFToggle(
  
                      onChanged: (val){
                        var str="";
                        if(val==false){
                            str="OFF";
                        }

                        else{
                          str="ON";
                        }
                        print(val);
                        print(globaldevicelist[position]);
                        print(mapfordevices[globaldevicelist[position]]);
                        print(str);
                        mqttClientManager.publishMessage( mapfordevices[globaldevicelist[position]]!, str);
                        
                      },
  
                      value: true,
  
                  )
  
  
  
                   ],
  
                   
  
  
  
                   
  
  
  
                  ),
  
                ),
              );
  
            },
  
          ),


 SizedBox(height: 10,),
          
      
    

// StreamBuilder(
//   stream: FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid).collection('Devices').snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if(!snapshot.hasData){
//       print('no data found');
//     }

//     return ListView(
//       children: snapshot.data.docs.map((document) {
//         return Container(

//           child: ListTile(title: Text(data),),
//         )
//       }),
//     );
//   }
  
  
//   )

// Column(
//     children: [
//         for (int i = 0; i < listofseleceddevices.length; i++) Container(child: Row(children: [Text(listofdevices[listofseleceddevices[i]], style: TextStyle(color: Colors.white),), GFToggle(
//     onChanged: (val){},
//     value: true,
//  )

// ],),)
//     ],
// ),


        ]
),
          // ElevatedButton(onPressed: () {
          //       mqttClientManager.publishMessage(
          // topic, "ON");
          //   }, child: Text('ON')),

          //   ElevatedButton(onPressed: () {
          //       mqttClientManager.publishMessage(
          // topic, "OFF");
          //   }, child: Text('OFF')),


          //   SizedBox(height: 40,),


           

          
         

          //checkExist()
        //     Container(
        //   alignment: Alignment.center,
        //   padding: const EdgeInsets.all(8.0),
        //   child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        // ),


          //    ListView.builder(
          //     scrollDirection: Axis.vertical,
          //     shrinkWrap: true,
          //     itemCount: _postsJson.length,
          //     itemBuilder: ( (context, index) {
          //       final post = _postsJson[index];
          //       return Text("ID: ${post["id"]} \n Name: ${post["name"]}", style: TextStyle(color: Colors.white),);
                
          //     }),
          // )




        
      
    );




  }

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
      
    });



  }

  @override
  void dispose() {
    mqttClientManager.disconnect();
    super.dispose();
  }

  //  Column buildColumn() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       // TextField(
  //       //   controller: _controller,
  //       //   decoration: const InputDecoration(hintText: 'Enter uid', hintStyle: TextStyle(color: Colors.white)),
  //       // ),
  //       ElevatedButton(
  //         onPressed: () {
  //           setState(() {
  //            // _futureAlbum = createAlbum(FirebaseAuth.instance.currentUser!.uid);
  //           });
  //         },
  //         child: const Text('Create Data'),
  //       ),
  //     ],
  //   );
  
  }

  // FutureBuilder<void> buildFutureBuilder() {
  //   return FutureBuilder<Album>(
  //     future: _futureAlbum,
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         print("I have reached here");
  //         globalportnumber = snapshot.data!.port;
  //           print("port: $globalportnumber " );
  //           checkport(globalportnumber);
  //       //  return Text(snapshot.data!.port.toString(), style: TextStyle(color: Colors.white),);
  //     //return Text(snapshot.data!.title);
  //       } else if (snapshot.hasError) {
  //         print( Text('${snapshot.error}'));
  //       }

  //        return globalportnumber;
  //     },
  //   );


 
  

// class DisplayDevices extends StatelessWidget {
//   const DisplayDevices({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return     Container(
    
//     width: size.width,
    
//       color: Colors.white,
    
    
    
//       child: Column(
    
    
    
//         children: [
    
//           Text('I am assuming this to be a flexible container', style: TextStyle(color: Colors.white),),
    
    
    
         
    
//         ],
    
    
    
//       ),
    
//     );
//   }
// }




//  Future<void> checkExist(String docID) async {       
//     try {
//         docID = FirebaseAuth.instance.currentUser!.uid;
//         await FirebaseFirestore.instance.doc("users/$docID").get().then((doc) {
//             exist = doc.exists;
//         });
//         print(exist) ;
//     } catch (e) {

//         // If any error
//         print("error: " );
//         print(e);
//         print(exist);
//         print("performing required operation");
//         // _futureAlbum = createAlbum(FirebaseAuth.instance.currentUser!.uid);

//         // buildFutureBuilder();



//     }
// }








