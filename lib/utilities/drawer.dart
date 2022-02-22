import 'package:azkar_2/main.dart';
import 'package:azkar_2/pages/about_me.dart';
import 'package:azkar_2/pages/counter.dart';
import 'package:azkar_2/pages/evining.dart';
import 'package:azkar_2/pages/morning.dart';
import 'package:azkar_2/pages/pray.dart';
import 'package:azkar_2/utilities/addition.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        child: ListView(
          children: [
            SizedBox(height: 10,),
            Divider(),
            ListTile(
              title: Text("الصفحة الرئيسية"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("اذكار الصباح"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Morning();
                    },
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("اذكار المساء"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Evening();
                    },
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("الاذكار بعد الصلاة"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Pray();
                    },
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("المسبحة"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Counter();
                    },
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("وقت اذكار الصباح والمساء"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Addition();
                    },
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("أخرى"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return About();
                    },
                  ),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
