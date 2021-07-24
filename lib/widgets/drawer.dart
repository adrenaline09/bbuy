import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple),
                margin: EdgeInsets.zero,
                accountName: Text("adrenaline_09"),
                accountEmail: Text("ms86@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  foregroundImage: AssetImage("assets/images/profile.png"),
                ),
                ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home,color: Colors.white,),
                      title: Text("Home",textScaleFactor :1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                      title: Text("Profile",textScaleFactor :1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.arrow_left_circle,color: Colors.white,),
                      title: Text("Logout",textScaleFactor :1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.phone,color: Colors.white,),
                      title: Text("Contact Us",textScaleFactor :1.2,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}