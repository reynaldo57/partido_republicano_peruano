import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partido_republicano_peruano/screens/admin/category_admin_page.dart';
import 'package:partido_republicano_peruano/screens/admin/login_admin_page.dart';
import 'package:partido_republicano_peruano/screens/admin/representative__admin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdminPage extends StatefulWidget {
  @override
  State<HomeAdminPage> createState() => _HomeAdminPageState();
}

class _HomeAdminPageState extends State<HomeAdminPage> {
  signOut() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await FirebaseAuth.instance.signOut();
    _prefs.setBool("isLogin", false);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginAdminPage(),), (route) => false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategoryAdminPage()));
              },
              title: Text("Autoridades"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegionalAdminPage()));
              },
              title: Text("Bases"),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Autoridades"),
              trailing: Icon(Icons.chevron_right),
            ),
          )
        ],
      ),
    );
  }
}
