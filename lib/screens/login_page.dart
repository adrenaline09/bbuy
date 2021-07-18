import 'package:flutter/material.dart';
import 'package:flutter_app_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false; 
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
            Text("Welcome $name",
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
                onChanged: (value) {
                  name = value;
                  setState(() {    //this set state is only for stateful widgets and whenever the formfield changes it call again the build method
                    
                  });
                },
                ),
                TextFormField(
                  obscureText: true,   //to hide the text field
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password"
                  ),
                ),
                SizedBox(  //basically this widget is used to creat space in b/w two things 
                height: 40.0,
                // child: Text("heu hue"),
                ),
               InkWell(   //this widget is used to make container clickable
                onTap: () async{
                  setState(() {
                    changeButton= true;
                  });
                  await Future.delayed(Duration(seconds: 1));
                  Navigator.pushNamed(context, Myroutes.homeRoute);
                },
                child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton?50:150,
                    height: 50,
                    alignment: Alignment.center,
                    
                    
                    child: changeButton?Icon(Icons.done_rounded,color: Colors.white,):Text(
                      "Login",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      // shape: changeButton?BoxShape.circle:BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(changeButton?50:8)
              
                    ),
                ),
              ),
              // ElevatedButton(
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(minimumSize: Size(150, 50)),
              //   onPressed:() {
              //     Navigator.pushNamed(context, Myroutes.homeRoute);
              //   },
              //   )
              ],),
            )
          ],
        ),
      )  
    );
  }
}
