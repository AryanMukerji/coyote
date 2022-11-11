
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_sign_in/google_sign_in.dart';


// class Something extends StatefulWidget {
//   const Something({super.key});

//   @override
//   State<Something> createState() => _SomethingState();
// }

// class _SomethingState extends State<Something> {
//   @override
//   Widget build(BuildContext context) {

//     final user  = FirebaseAuth.instance.currentUser!;
//     return  Scaffold(
//       body: Column(
//         children: [
//           Text('Profile Page'),

//           SizedBox(height: 10,),

//           CircleAvatar(
//             radius: 40,
//             backgroundImage: NetworkImage(user.photoURL!),
//           ),
//           SizedBox(height: 10,),
          
//           Text('Name: ' + user.displayName!),

//           SizedBox(height: 10,),
          
//           Text('Email: ' + user.email!),

//         ],
//       ),
//     );
//   }
// }