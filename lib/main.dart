import 'package:aquaculture/loginpage.dart';
import 'package:aquaculture/notifcations.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'weatherprovider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await FirebaseApi().initNotifications();
  runApp( ChangeNotifierProvider(
    create:(Context)=>WeatherProvider(),
    child:const myapp()
  ));
}
class myapp extends StatefulWidget {
  const myapp({super.key});
  @override
  State<myapp> createState() => _myappState();
}

class _myappState extends State<myapp> {
  @override
  Widget build(BuildContext context) {
     double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return const MaterialApp(
      home: Loginpage()
    );
  }
}