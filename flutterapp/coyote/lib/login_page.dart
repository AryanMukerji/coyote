import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coyote/auth_service.dart';

   


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
  @override
  Widget build(BuildContext context) => 
  Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage('assets/background.png'),
      fit: BoxFit.cover,
      ),
    ),

     child: Scaffold(
      backgroundColor: Colors.transparent,
      
      body: Container(
        
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(
                height: 65
              ),
              Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                          image: AssetImage('assets/coyote_login.png'),
                          height: 200,
                          width: 280)),

                          SizedBox(height: 40,),

                            Text(
                'COYOTE',
                style: TextStyle(
                    color:Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold, fontFamily: 'OCR'),
              ),
                ],
              ),

              SizedBox(height: 300),




              GestureDetector(
                onTap: () async {
                  await AuthService().signInWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   
                   Image.asset('assets/google_signin.png', height: 60, width: 60,),
                   SizedBox(width: 15,),
              
                    Text('SIGN IN WITH GOOGLE', style: TextStyle(color: Colors.white, fontFamily: 'OCR', fontSize: 16),)
                  ],
                ),
              ),

            
              // SizedBox(
              //   height: size.height * 0.25,
              // ),

//                Padding(
//                 padding: const EdgeInsets.only(left: 50, right: 50),
//                 child: ElevatedButton(
//                   style: ButtonStyle(
//                     // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//     RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(18.0),
//       side: BorderSide(color: Colors.white)
//     )
//   )
// ),
//                   // color: Colors.white,
//                   // elevation: 10,
//                   child: Row(
//                    // mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(20),
//                         height: 30.0,
//                         width: 30.0,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image:
//                                   AssetImage('assets/google_signin.png'),
//                               fit: BoxFit.cover),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                       Text("Sign in with Google", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'OCR'),)
//                     ],
//                   ),
                   
//                   // by onpressed we call the function signup function
//                   onPressed: () {
//                     AuthService().signInWithGoogle();
//                   },
//                 ),
//                ),
              // _entryField('Email', _controllerEmail),
              //  SizedBox(
              //   height: size.height * 0.02,
              // ),
              // _entryField('Password', _controllerPassword),
              // SizedBox(
              //   height: size.height * 0.015,
              // ),
              // _errorMessage(),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              // _submitButton(),
              // SizedBox(
              //   height: size.height * 0.02,
              // ),
              // _loginOrRegisterButton(),
            ],
          ),
        ),
      ),
     ),
    );


    

    // return Scaffold(
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     title: const Text("Google Login"),
    //     backgroundColor: Colors.green,
    //   ),
    //   body: Container(
    //     width: size.width,
    //     height: size.height,
    //     padding: EdgeInsets.only(
    //         left: 20, right: 20, top: size.height * 0.2, bottom: size.height * 0.5),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         const Text("Hello, \nGoogle sign in",
    //             style: TextStyle(
    //                 fontSize: 30
    //             )),
    //         GestureDetector(
    //             onTap: () {
    //               AuthService().signInWithGoogle();
    //             },
    //             child: const Image( image: AssetImage('assets/google.png'))),
    //       ],
    //     ),
    //   ),
    // );
  }
