// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '../auth.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String? errorMessage = '';
//   bool isLogin = true;

//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();

//   Future<void> signInWithEmailAndPassword() async {
//     try {
//       await Auth().signInWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Future<void> createUserWithEmailAndPassword() async {
//     try {
//       await Auth().createUserWithEmailAndPassword(
//         email: _controllerEmail.text,
//         password: _controllerPassword.text,
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message;
//       });
//     }
//   }

//   Widget _title() {
//     return const Text('Coyote');
//   }

//   // Widget _entryField(
//   //   String title,
//   //   TextEditingController controller,
//   // ) {
//   //   return TextField(
//   //     controller: controller,
//   //     decoration: InputDecoration(
//   //       labelText: title,
//   //     ),
//   //   );
//   // }

// Widget _entryField(
//     String title,
//     TextEditingController controller,
//   ) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: new BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: Colors.black,
//         borderRadius: BorderRadius.all(const Radius.circular(15)),
//         border: new Border.all(color: Colors.black,
        
//         width: 1.0)
//       ),
//       child: TextField(
//         controller: controller,
//       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
//                         hintText: title,
//                         hintStyle: TextStyle(
//                             color:Color.fromARGB(255, 238, 48, 83),
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
                     
//                       cursorColor: Colors.white,
//                       textInputAction: TextInputAction.next,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//       ),
//     );

//     }

//   Widget _errorMessage() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(errorMessage == '' ? '' : 'Humm ? $errorMessage', style: TextStyle(color: Colors.white, fontSize: 15),),
//     );
//   }

//   Widget _submitButton() {
//     return Container(
//        height: 50,
//                 width: 325,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(35),
//                   color: Colors.white,
                  
//       ),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.white, ),
//         onPressed:
//             isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,  
//         child: Text(isLogin ? 'Login' : 'Register', style: TextStyle(color:Color.fromARGB(255, 238, 48, 83), fontSize: 18 ),),
        
//       ),
//     );
//   }

//   Widget _loginOrRegisterButton() {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           isLogin = !isLogin;
//         });
//       },
//       child: Text(isLogin ? 'Register instead ?' : 'Login instead ?', style: TextStyle(color: Colors.white, fontSize: 18),),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//         Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Color.fromARGB(95, 158, 158, 158),
      
//       body: Container(
        
//         height: double.infinity,
//         width: double.infinity,
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:[
//               SizedBox(
//                 height: size.height * 0.04,
//               ),
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image(
//                       image: AssetImage('assets/coyote_removebg.png'),
//                       height: 200,
//                       width: 221)),
//               // SizedBox(height: size.height*0.02,),

//               Text(
//                 'COYOTE',
//                 style: TextStyle(
//                     color:Color.fromARGB(255, 238, 48, 83),
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: size.height * 0.055,
//               ),
//               _entryField('Email', _controllerEmail),
//                SizedBox(
//                 height: size.height * 0.02,
//               ),
//               _entryField('Password', _controllerPassword),
//               SizedBox(
//                 height: size.height * 0.015,
//               ),
//               _errorMessage(),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               _submitButton(),
//               SizedBox(
//                 height: size.height * 0.02,
//               ),
//               _loginOrRegisterButton(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }