import 'package:flutter/material.dart';
import 'package:coyote/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int newnumber=0;
int iffolderexistsnumber=0;
int finalportnumber=0;

Future<void>createAlbum(String uid) async {
  final response = await http.post(
    Uri.parse('http://172.104.206.232/test'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'uid': uid,
    }),
  );

  if (response.statusCode == 200) {
   
    var abcd = jsonDecode(response.body);
    int portabcd = abcd['port'];
    String uidabcd = abcd['uid'];
    print(portabcd);
    print(uidabcd);
    newnumber = portabcd;
    finalportnumber=newnumber;
    print("global port number is $newnumber");
    
    

    // If the server did return a 201 CREATED response,
    // then parse the JSON.
   // return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}


class DisplayPort extends StatefulWidget {
  const DisplayPort({super.key});

  @override
  State<DisplayPort> createState() => _DisplayPortState();
}

class _DisplayPortState extends State<DisplayPort> {
 var currentUser = FirebaseAuth.instance.currentUser;
  String image_url = FirebaseAuth.instance.currentUser!.photoURL!;

    
  Widget _title() {
    return const Text('COYOTE', style: TextStyle(color: Colors.white, fontFamily: 'OCR'),);
  }

  @override
  void initState() {
    killme();
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
          Navigator.pushNamed(context, 'loginpage');
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

       body: Center(
         child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              SizedBox(height: 30,),

              Column(
                children: [
                  ClipRRect(
    borderRadius: BorderRadius.circular(60.0),
    child: Image.network(
          image_url,
          // height: 150.0,
          // width: 100.0,
    ),
),
               

SizedBox(height: 10,),

                Text(
                   FirebaseAuth.instance.currentUser!.displayName!,
                   style: const TextStyle(
                       fontSize: 17,  color: Colors.white, fontFamily: 'RobotoMono'),
                  ),

                  SizedBox(height: 5,),

                   Text(
                    FirebaseAuth.instance.currentUser!.email!,
                    style: const TextStyle(
                   fontSize: 17,  color: Colors.white, fontFamily: 'RobotoMono'),
                  ),

                   ],
              ),




          //   Padding(
          //     padding: const EdgeInsets.all(14.0),
          //     child: Wrap(
               
          // direction: Axis.vertical,
          //       children:<Widget>[
          //          Row(
          //            children: [
          //              Text('Hello ', style: TextStyle(color: Colors.white,  fontSize: 20, fontWeight: FontWeight.bold,),),

          //              Text(
          //          FirebaseAuth.instance.currentUser!.displayName!,
          //          style: const TextStyle(
          //              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          //         ),
              
          //          Text(' !', style: TextStyle(color: Colors.white,  fontSize: 20, fontWeight: FontWeight.bold,),),
          //            ],
          //          ),
              
                    
          //       ],
          //     ),
          //   ),

             
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 18, 18, 18),
                child: Wrap(
                  direction: Axis.horizontal,
                children:<Widget>[
                 Text('We hope that you enjoy using our application and it serves you the purpose which you expect.', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono'),),
                
                  // Text(
                  //   FirebaseAuth.instance.currentUser!.email!,
                  //   style: const TextStyle(
                  //  fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'RobotoMono'),
                  // ),
                
                  // Text('as per you google account.', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono' ),),
                ],
                ),
              ),

              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('Thank You!', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono' ),),
              ),
             
              const SizedBox(
                height: 30,
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 238, 48, 83),),
                onPressed: () {
                Navigator.pushNamed(context, 'getport');
              }, child: Text('Proceed', style: TextStyle(color: Colors.white),)),
              // MaterialButton(
              //   padding: const EdgeInsets.all(10),
              //   color: Colors.green,
              //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              //   child: const Text(
              //     'LOGGING OUT',
              //     style: TextStyle(color: Colors.white, fontSize: 15),
              //   ),
              //   onPressed: () {
              //     AuthService().signOut();
              //   },
              // ),
            ],
          ),
       ),
    );
  }

  

killme()  {
  var docRef = FirebaseFirestore.instance.collection("setport").doc(FirebaseAuth.instance.currentUser!.uid);
docRef.get().then((DocumentSnapshot doc) async {
    if(doc.exists){
        print("doc exists");
//         var collection = FirebaseFirestore.instance.collection('users');
// var docSnapshot =  collection.doc('doc_id').get();
// if (docSnapshot.exists) {
  Map<String, dynamic> datafrominternet = doc.data() as Map<String, dynamic>;
  iffolderexistsnumber=datafrominternet['port'];  
  finalportnumber=iffolderexistsnumber;
  print("data from internet port number: $iffolderexistsnumber");
 
  //var value = data['port']; // <-- The value you want to retrieve. 
  // Call setState if needed.
}
    

    else{
      print("doc does not exist");
      await createAlbum(FirebaseAuth.instance.currentUser!.uid);
      checkport(newnumber);
      print("I have reach checkport function");
  
  // final docUser = FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid);
  // final json = {
  //   'port': globalportnumber,
  // };

  //  docUser.set(json);
  //     print("global port number: $globalportnumber");
     

      //  _futureAlbum = createAlbum(FirebaseAuth.instance.currentUser!.uid);
       
      //   if(_futureAlbum != null)
      //   {
      //     print('Building future builder');
      //     buildFutureBuilder();
      //   }

        //else{
        //   print("_futureAlbum is null");
        // }

    }
  
  },
  onError: (e) => print("Error getting document: $e"),
);
  }

  
  void checkport(int integer) async {
    print("I have reach checkport function");
  
  final docUser = FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid);
  final json = {
    'port': integer,
  };

  await docUser.set(json);
  }

}