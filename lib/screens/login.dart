import 'package:flutter/material.dart';
import 'package:swastha/widgets/circularLoginComponent.dart';
import 'package:swastha/widgets/myTextField.dart';

class Login extends StatelessWidget {
  static const String id ='Login';

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:Scaffold(
          backgroundColor: const Color(0xffF4F6FA),
          appBar: AppBar(
            title:Text("Login"),
            backgroundColor:const Color(0xff7A64E4),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/logo.png',height: 100,width: 100,),
                const myTextField(text:"Username",icon:Icons.people),
                const   myTextField(text:"Password",icon:Icons.lock),
                SizedBox.fromSize(size: Size(0, 30)),
                const Text("Sign in with",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      circularLoginOption(),
                      circularLoginOption(),
                      circularLoginOption()
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
