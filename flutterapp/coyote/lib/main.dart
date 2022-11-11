// import 'package:coyote/something.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:coyote/homepage.dart';
// import 'package:provider/provider.dart';
// import 'google_sign_in.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) => ChangeNotifierProvider(
//     create: (context) => GoogleSignInProvider(),
//     child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'MainPage',
//       theme: ThemeData.dark(),
//       home: HomePage(),

//       routes: {
//       'Something': (context) => Something(),
//       'HomePage': (context) => HomePage(),
      
//     },
//       ),
//   );
// }



import 'package:coyote/configure.dart';
import 'package:coyote/display_port.dart';
import 'package:coyote/get_devices.dart';
import 'package:coyote/get_port.dart';
import 'package:coyote/homepageforgoogle.dart';
import 'package:coyote/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:coyote/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      //  primarySwatch: Colors.orange,
      ),

      routes: {
    'getdevices': (context) =>  GetDevices(),
    'configure': (context) =>  Configure(),
    'homepage': (context) =>  HomePage(),
    'getport': (context) =>  GetPort(),
  },
     home: AuthService().handleAuthState(),
    );
  }
}