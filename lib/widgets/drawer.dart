import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.zero,
                accountName: Text("adrenaline_09"),
                accountEmail: Text("ms86@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  foregroundImage: AssetImage("assets/images/profile.png"),
                ),
                ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.deepOrange.shade900,),
                      title: Text("Home",textScaleFactor :1.2,style: TextStyle(color: Colors.deepOrange.shade900),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.deepOrange.shade900,),
                      title: Text("Profile",textScaleFactor :1.2,style: TextStyle(color: Colors.deepOrange.shade900),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.arrow_left_circle,color: Colors.deepOrange.shade900,),
                      title: Text("Logout",textScaleFactor :1.2,style: TextStyle(color: Colors.deepOrange.shade900),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone,color: Colors.deepOrange.shade900,),
                      title: Text("Contact Us",textScaleFactor :1.2,style: TextStyle(color: Colors.deepOrange.shade900),),
            ),
          ],
        ),
      ),
    );
  }
}