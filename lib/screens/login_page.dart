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
  final _formkey = GlobalKey<FormState>();

movetoHome(BuildContext context) async{
    if(_formkey.currentState!.validate()){
          setState(() {
    changeButton= true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, Myroutes.homeRoute);
    setState(() {
      changeButton= false; //back aane pe login page refresh ho jae
    });
    }

}

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,  //keepting the bg white coz img border shouldn't be visible
      child: SingleChildScrollView(   //this method is use to wrap column to avoid overflow on small screen and give scrolling effect
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png",fit: BoxFit.cover,),
              SizedBox(  //basically this widget is used to creat space in b/w two things 
                height: 20.0,
                // child: Text("heu hue"),
              ),
              Text("Welcome $name",
              style: TextStyle(
                color: Colors.deepOrange.shade900,
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
                    validator:(value){
                      if(value!.isEmpty){
                        return "This field can't be empty";
                      }                      
                      return null;                      
                    },
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
                    validator:(value){
                      if(value!.isEmpty){
                        return "This field can't be empty";
                      }
                      else if(value.length<6){
                        return "Password length is less than 6";
                      }                     
                      return null;           
                    },
                  ),
                  SizedBox(  //basically this widget is used to creat space in b/w two things 
                  height: 40.0,
                  // child: Text("heu hue"),
                  ),
                  Material(  //inkwell ko material ancestor chahea for proper functioning
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(changeButton?50:8),
                   child: InkWell( //this widget is used to make container clickable
                       
                    onTap: () => movetoHome(context),
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton?50:150,
                        height: 50,
                        alignment: Alignment.center,
                        
                        
                        child: changeButton?Icon(Icons.done_rounded,color: Colors.white,):Text(
                          "Login",
                          style: TextStyle
                          (
                          color: Colors.deepOrange.shade900,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                          ),
                        ),
                    ),
                    ),
                 ),
                ],),
              )
            ],
          ),
        ),
      )  
    );
  }
}
