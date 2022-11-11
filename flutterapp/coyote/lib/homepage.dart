// import 'package:coyote/google_sign_in.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       body: Center(
//         child: Column(
//           children:  [
//             Text('Hi welcome to my app'),

//             SizedBox(height: 15,),

//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//               icon: FaIcon(FontAwesomeIcons.google, color: Colors.red,),
//               onPressed: () {
//                 final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
//                 provider.googleLogin();
//               }, label: Text('Sign up with google')),

//               SizedBox(height: 15,),

//               TextButton(onPressed: (){
//                 final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
//                 provider.logout();
//               }, child: Text('Logout', style: TextStyle(color: Colors.white),))
//           ],
//         ),
//       ),
//     );
//   }
// }