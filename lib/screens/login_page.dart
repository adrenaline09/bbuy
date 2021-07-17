import 'package:flutter/material.dart';
import 'package:flutter_app_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,  //keepting the bg white coz img border shouldn't be visible
      child: SingleChildScrollView(   //this method is use to wrap column to avoid overflow on small screen and give scrolling effect
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png",fit: BoxFit.cover,),
            SizedBox(  //basically this widget is used to creat space in b/w two things 
              height: 20.0,
              // child: Text("heu hue"),
            ),
            Text("WELCOME TO MY HOUSE",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
              child: Column(
                children: [
                TextFormField(
                  decoration: InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username"
                ),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password"
                ),
              ),
              SizedBox(  //basically this widget is used to creat space in b/w two things 
              height: 40.0,
              // child: Text("heu hue"),
              ),
              ElevatedButton(
                child: Text("Login"),
                style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                onPressed:() {
                  Navigator.pushNamed(context, Myroutes.homeRoute);
                },
                )
              ],),
            )
          ],
        ),
      )  
    );
  }
}
