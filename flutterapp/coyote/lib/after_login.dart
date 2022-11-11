// import 'package:coyote/google_sign_in.dart';
// import 'package:coyote/homepage.dart';
// import 'package:coyote/something.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class AfterLogin extends StatefulWidget {
//   const AfterLogin({super.key});

//   @override
//   State<AfterLogin> createState() => _AfterLoginState();
// }

// class _AfterLoginState extends State<AfterLogin> {
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {

//         // return Something();
//         if(snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//            //return Something();
//         } 

//         else if(snapshot.hasData){
//           Navigator.pushNamed(context, 'Something');
//         }

//         else if(snapshot.hasError) {
//          //  return Something();
          
//           return Center(child: Text('Something Went Wrong'));
//         }

//         else {
//       Navigator.pushNamed(context, 'HomePage');
//         }

//         return Something();
//       }
    
//     ),
//   );
// }