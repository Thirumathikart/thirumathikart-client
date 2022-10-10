import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thirumathikart_app/controllers/home_controller.dart';
import 'package:thirumathikart_app/views/home.dart';

class AboutPage extends GetView<HomeController> {
  const AboutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: const Text(
                    'ThirumathiKart',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  'Version 1.1 (1)',
                  style: TextStyle(
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    Widget buttonSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                ),
              ),
              child: Text('Domain',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text('thirumathikart.nitt.edu'),
                  ),
                );
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                ),
              ),
              child: Text('License',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text('Lorem Ipsum'),
                  ),
                );
              }),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(0),
                  ),
                ),
              ),
              child: Text('Changelog',
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text('Lorem Ipsum'),
                  ),
                );
              }),
        ]);

    Widget linebreak = const Padding(
      padding: EdgeInsets.all(8),
      child: Divider(
        height: 20,
        thickness: 0.2,
        indent: 10,
        endIndent: 10,
        color: Colors.black,
      ),
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        'We believe in the use of technology for the empowerment of everyone!',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromARGB(255, 108, 108, 108),
        ),
      ),
    );

    Widget cardWidget1 = Container(
      padding: const EdgeInsets.fromLTRB(32, 32, 32, 8),
      child: InkWell(
        onTap: () =>
            launchUrl(Uri.parse('https://github.com/mikepenz/AboutLibraries')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('AboutLibraries',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Mike Penz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                            text: 'AboutLibraries',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(
                          text:
                              ' is a library to offer you all the information you need of your libraries!',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text(
                    'Most modern apps feature a Used Library section, which requires infromation about those respective libs. As it gets annoying to always copy those strings to your app, I have developed this small helper library to provide the required infromation',
                    style: TextStyle(
                      color: Color.fromARGB(255, 108, 108, 108),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget2 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () =>
            launchUrl(Uri.parse('https://github.com/mikepenz/Android-Iconics')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Android-Iconics',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Mike Penz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                          text:
                              'This library allows you to include vector icons everywhere in your project. No limits are given. Scale with no limit, use any Color at any time, provide a contour, and many additional customizations',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget3 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      // ignore: unnecessary_new
      child: new InkWell(
        onTap: () => launchUrl(
            Uri.parse('https://github.com/daimajia/AndroidViewAnimations')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('AndroidViewAnimations',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('daimajia',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                          text: 'Animations for views',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget4 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () =>
            launchUrl(Uri.parse('http://jakewharton.github.io/butterknife/')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Butter Knife',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Jake\nWharton',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                          text:
                              'Field and method binding for Android views which uses annotation processing to generate boilerplate code for your',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget5 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () => launchUrl(
            Uri.parse('https://github.com/hdodenhof/CircleImageView')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('CircleImageView',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Henning\nDodenhof',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                          text: 'A circular ImageView for Android',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget6 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(
            'https://developer.android.com/reference/android/support/constraint/package-summary.html')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Constraint Layout',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('AOSP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                          text:
                              'The ConstraintLayout package allows you to create large and complex layouts with a flat view hierarchy',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget7 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () => launchUrl(
            Uri.parse('https://github.com/mikepenz/CrossfadeDrawerLayout')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('CrossFadeDrawerLayout',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Mike Penz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                            text: 'CrossFadeDrawerLayout.',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(
                          text:
                              ' Add a 2-step DrawerLayout to your application, with a nice crossfade effect.',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget8 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () =>
            launchUrl(Uri.parse('https://github.com/mikepenz/FastAdapter')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('FastAdapter',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Mike Penz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                            text: 'FastAdapter,',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(
                          text:
                              ' the bullet proof, fast and easy to use adapter library, which minimizes developing time to a fraction...',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget9 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () =>
            launchUrl(Uri.parse('https://github.com/mikepenz/MaterialDrawer')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('MaterialDrawer',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Mike Penz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                            text: 'MaterialDrawer',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(
                          text:
                              ' the flexible, easy to use, all in one drawer library for your Android project.',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget10 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () => launchUrl(
            Uri.parse('https://github.com/rengwuxian/MaterialEditText')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('MaterialEditText',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Kai Zhu',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                          text:
                              'MaterialEditText, the EditText in Material Design, with more features that Google Material Design Spec has introduced.',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget cardWidget11 = Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: InkWell(
        onTap: () =>
            launchUrl(Uri.parse('https://github.com/mikepenz/Materialize')),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Materialize',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          )),
                      Text('Mike Penz',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 108, 108, 108),
                          )),
                    ],
                  ),
                  SizedBox(height: 20),
                  RichText(
                      text: TextSpan(
                          style: TextStyle(
                              color: Color.fromARGB(255, 108, 108, 108)),
                          children: const [
                        TextSpan(
                            text: 'Materialize',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(
                          text:
                              ' comes with useful helper classes, the complete material color palette, and many additional utils. Use its theme as base. Let it manage your StatusBar, NavigationBar, Fullscreen behavious...',
                        ),
                      ])),
                  SizedBox(height: 20),
                  Text('Apache Version 2.0',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color.fromARGB(255, 108, 108, 108),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThirumathiKart',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()))
            },
          ),
          title: const Text('About Us'),
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/tklogo.jpeg',
              width: 140,
              height: 100,
              fit: BoxFit.contain,
            ),
            titleSection,
            buttonSection,
            linebreak,
            textSection,
            cardWidget1,
            linebreak,
            cardWidget2,
            linebreak,
            cardWidget3,
            linebreak,
            cardWidget4,
            linebreak,
            cardWidget5,
            linebreak,
            cardWidget6,
            linebreak,
            cardWidget7,
            linebreak,
            cardWidget8,
            linebreak,
            cardWidget9,
            linebreak,
            cardWidget10,
            linebreak,
            cardWidget11,
          ],
        ),
      ),
    );
  }
}
