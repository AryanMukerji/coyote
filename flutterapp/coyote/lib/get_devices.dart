import 'package:flutter/material.dart';
import 'package:coyote/auth_service.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coyote/ask_to_proceed.dart';

late List globaldevicelist=[];
 Map<String, String> displaydevicesonscreen = mapfordevices;
List listofseleceddevices=[];
List<String> listofdevices = [];

// maptostring(){
//   for(int i=0; i<displaydevicesonscreen.length; i++){
//     listofseleceddevices.add(displaydevicesonscreen.keys);
//   }
// }


class GetDevices extends StatefulWidget {
  const GetDevices({super.key});

  @override
  State<GetDevices> createState() => _GetDevicesState();
}

class _GetDevicesState extends State<GetDevices> {

  
  Widget _title() {
    return const Text('COYOTE', style: TextStyle(color: Colors.white, fontFamily: 'OCR'),);
  }

  @override
  Widget build(BuildContext context) {

     var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    
    
    String indexes;

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


      body: Column(
        children: [

            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(12),
              child: Text('Select the devices you want to configure: ', style: TextStyle(color: Colors.white,  fontSize: 16, fontFamily: 'RobotoMono' ),)),

            SizedBox(height: 20,),

          
           Container(
  child: GFMultiSelect(
    items: listofdevices,  // will be displayed in realtime
    onSelect: (value) {
      indexes=value.toString();
      print("indexes: $indexes");
     // int parsing = int.parse(indexes);
    //  print("pasing: $parsing");
      print('selected $value ');
      listofseleceddevices=value;
     // listofseleceddevices.add(listofdevices.elementAt(parsing));
      print(listofseleceddevices);
      print(listofseleceddevices[0]);
     // String modify = listofseleceddevices[0].toString();
     for(int i=0; i<listofseleceddevices.length; i++){
      print(listofdevices[listofseleceddevices[i]]);    // devices have been accessed
     }

     
        // globaldevicelist.add(listofdevices[listofseleceddevices[i]]);    // devices have been accessed
     

    //  for(int i=0; i<globaldevicelist.length; i++){
    //   print(" global devices: ${globaldevicelist[i]}");   // devices have been accessed
    //  }

    },
    dropdownTitleTileText: 'Choose Devices',
    dropdownTitleTileColor: Colors.white,
    dropdownTitleTileMargin: EdgeInsets.only(
        top: 22, left: 18, right: 18, bottom: 5),
    dropdownTitleTilePadding: EdgeInsets.all(10),
    dropdownUnderlineBorder: const BorderSide(
        color: Colors.transparent, width: 2),
    dropdownTitleTileBorder:
    Border.all(color: Colors.grey, width: 1),
    dropdownTitleTileBorderRadius: BorderRadius.circular(5),
    expandedIcon: const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black54,
    ),
    collapsedIcon: const Icon(
      Icons.keyboard_arrow_up,
      color: Colors.black54,
    ),
    submitButton: MaterialButton(
      child: Text('OK', style: TextStyle( color: Colors.white),), onPressed: () async {
        final docUser = FirebaseFirestore.instance.collection('setport').doc(FirebaseAuth.instance.currentUser!.uid).collection('Devices').doc('selected_devices');
        for(int i =0; i<listofseleceddevices.length; i++){
  final json = {
    'device$i': listofdevices[listofseleceddevices[i]],
  };

  await docUser.set(json,SetOptions(merge: true));
        }
        print("devices sent on firestore");

       // functiontosendmessage();
        print('send message function done');

        for(int i=0; i<listofseleceddevices.length; i++){
          globaldevicelist.add(listofdevices[listofseleceddevices[i]]);
        }

        Navigator.pushNamed(context, 'homepage');
          
      },
      ) ,
    dropdownTitleTileTextStyle: const TextStyle(
        fontSize: 14, color: Colors.black54),
    padding: const EdgeInsets.all(6),
    margin: const EdgeInsets.all(6),
    type: GFCheckboxType.basic,
    activeBgColor: Color.fromARGB(255, 238, 48, 83),
    inactiveBorderColor: Colors.grey,
  ),
),




        ],
      ),
    );

  } 
  }

  
//    functiontosendmessage() {
//     mqttClientManager.publishMessage( tosenddata, datatosend);
//     setupUpdatesListener();
//   }
// }