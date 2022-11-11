//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:coyote/auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var currentUser = FirebaseAuth.instance.currentUser;
  String image_url = FirebaseAuth.instance.currentUser!.photoURL!;
    

    // getProfileImage() {
    //   if(currentUser != null){
    //     return Image.network(image_url);
    //   }
    // }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      
      backgroundColor: Color.fromARGB(209, 27, 26, 26),
      body: Column(
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 18, 18),
              child: Wrap(
                direction: Axis.horizontal,
              children:<Widget>[
               Text('We hope that you enjoyed using our application and it served you the purpose which you expected. We are open to any feedbacks or suggestions that you may have. You can mail us your feedback from your registered email id, which is ', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono'),),
              
                Text(
                  FirebaseAuth.instance.currentUser!.email!,
                  style: const TextStyle(
                 fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'RobotoMono'),
                ),
              
                Text('as per you google account.', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono' ),),
              ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text('Thank You!', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono' ),),
            ),
           
            const SizedBox(
              height: 30,
            ),
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
    );
  }
}