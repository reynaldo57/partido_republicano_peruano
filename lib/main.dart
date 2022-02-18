import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:partido_republicano_peruano/constants.dart';
import 'package:partido_republicano_peruano/screens/admin/home_admin_page.dart';
import 'package:partido_republicano_peruano/screens/admin/login_admin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Partido Republicano Peruano',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.red,

      ),
      home: LoginAdminPage(),
    );
  }
}
class CheckUserLogin extends StatelessWidget {

  Future check() async{
    final user = await FirebaseAuth.instance.currentUser;
    return user!.uid;

  }
  Future<bool> checkIsLogin() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool res = _prefs.getBool("isLogin") ?? false;
    return res;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkIsLogin(),
      builder: (BuildContext context, AsyncSnapshot snap){
        if(snap.hasData){
          if(snap.data){
            return HomeAdminPage();
          }else{
            return LoginAdminPage();
          }
          //HomeAdminPage
        }
        return LoginAdminPage();
      },
    );
  }
}

