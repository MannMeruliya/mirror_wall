import 'package:flutter/material.dart';
import 'package:mirror_wall/global.dart';
import 'package:mirror_wall/screen/edu.dart';
import 'package:mirror_wall/screen/webpage.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.3),
        title: Text("Mirror Wall",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => webPage()));

                 setState(() {
                   Global.weburl = "https://www.google.co.in";
                 });
                  },
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Google",style: TextStyle(color: Colors.white,fontSize: 50),),
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => edu()));
                  },
                  child: Container(
                    child: Text("Education",style: TextStyle(color: Colors.white,fontSize: 50),),

                    height: 350,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    height: 350,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
