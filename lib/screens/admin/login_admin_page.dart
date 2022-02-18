

import 'package:flutter/material.dart';
import 'package:partido_republicano_peruano/screens/admin/home_admin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:partido_republicano_peruano/screens/admin/register_admin_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginAdminPage extends StatefulWidget {

  @override
  _LoginAdminPageState createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final _formKey = GlobalKey<FormState>();



  signInEmailPassword() async {
    try{
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "mandarina@gmail.com",
        password: "3volution123",
      );
      _prefs.setBool("isLogin", true);
      //print("DATA AUTH::: ${await userCredential.user!.getIdToken()}");
      print("DATA AUTH::: ${userCredential.user}");


      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeAdminPage(),), (route) => false);

    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "El correo electronico no esta registrado",
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }else if(e.code == "wrong-password"){

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "La contraseña se incorrecta",
            ),
            backgroundColor: Colors.redAccent,
          ),
        );

      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Text(
                      "Iniciar una  sgfgfgtgtgesion",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: "Correo Electronico",
                          hintText: "Correo Elejujthctronico"
                      ),
                      validator: (String? value){
                        if(value!.isEmpty || value == null){
                          return "El Campo es obligatorio";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 14.0,
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Contraseña",
                          hintText: "Contraseña"
                      ),
                      validator: (String? value){
                        if(value!.isEmpty || value == null){
                          return "El Campo es obligatorio";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: (){
                          // if(_formKey.currentState!.validate()){
                          //
                          // }
                          signInEmailPassword();
                        },
                        child: Text(
                          "Iniciar Sesion",
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=>RegisterAdminPage(),
                          ),
                        );
                      },
                      child: Text("Registrar"),
                    ),


                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
