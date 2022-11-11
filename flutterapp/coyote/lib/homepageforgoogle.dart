
import 'package:coyote/auth.dart';
import 'package:coyote/configure.dart';
import 'package:coyote/profile.dart';
import 'package:coyote/sequence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coyote/auth_service.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('COYOTE', style: TextStyle(color: Colors.white, fontFamily: 'OCR'),);
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }


  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  List _widgetOptions = [
    Configure(),
    Sequence(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      // body: Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   padding: const EdgeInsets.all(20),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,   
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       _userUid(),
      //       _signOutButton(),
      //     ],
      //   ),
      // ),
       body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white,) ,
            label: 'Configure',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.white,),
            label: 'Sequence',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded, color: Colors.white,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 238, 48, 83),
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.black87,
      ),
    
    );
  }
}




















// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:coyote/auth_service.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //String? user = FirebaseAuth.instance.currentUser!.email ?? FirebaseAuth.instance.currentUser!.displayName;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[

//             Text(
//               FirebaseAuth.instance.currentUser!.displayName!,
//               style: const TextStyle(
//                   fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               FirebaseAuth.instance.currentUser!.email!,
//               style: const TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             MaterialButton(
//               padding: const EdgeInsets.all(10),
//               color: Colors.green,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//               child: const Text(
//                 'LOG OUT',
//                 style: TextStyle(color: Colors.white, fontSize: 15),
//               ),
//               onPressed: () {
//                 AuthService().signOut();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }