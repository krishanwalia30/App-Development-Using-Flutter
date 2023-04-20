// import 'package:curved_drawer_fork/curved_drawer_fork.dart';

// import 'package:flutter/material.dart';
// import 'package:medium/pages/cameraPage.dart';
// import 'package:medium/pages/contactPage.dart';
// import 'package:medium/pages/homePage.dart';
// import 'package:medium/pages/profielPage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   final _pageController = PageController();

//   @override
//   void dispose() {
//     _pageController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text('Curved Drawer Fork'),
//           backgroundColor: const Color.fromARGB(255, 255, 240, 219),
//           foregroundColor: Colors.black,
//         ),
//         body: PageView(
//           controller: _pageController,
//           children: const <Widget>[
//             HomePage(),
//             CameraPage(),
//             ProfilePage(),
//             ContactPage()
//           ],
//         ),
//         drawer: CurvedDrawer(
//           color: const Color.fromARGB(255, 255, 240, 219),
//           buttonBackgroundColor: Colors.lightGreenAccent,
//           labelColor: Colors.red,
//           backgroundColor: Colors.transparent,
//           width: 75.0,
//           items: const <DrawerItem>[
//             DrawerItem(icon: Icon(Icons.home), label: "Home"),
//             DrawerItem(icon: Icon(Icons.camera), label: "Camera"),
//             DrawerItem(icon: Icon(Icons.person), label: "Profile"),
//             //Optional Label Text
//             DrawerItem(icon: Icon(Icons.phone), label: "Contact")
//           ],
//           onTap: (index) {
//             print('Button Pressed');

//             _pageController.animateToPage(index,
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeOut);
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primaryColor: Colors.red),
//       home: EmailSender(),
//     );
//   }
// }

// class EmailSender extends StatefulWidget {
//   const EmailSender({Key? key}) : super(key: key);

//   @override
//   _EmailSenderState createState() => _EmailSenderState();
// }

// class _EmailSenderState extends State<EmailSender> {
//   List<String> attachments = [];
//   bool isHTML = false;

//   final _recipientController = TextEditingController(
//     text: 'example@example.com',
//   );

//   final _subjectController = TextEditingController(text: 'The subject');

//   final _bodyController = TextEditingController(
//     text: 'Mail body.',
//   );

//   Future<void> send() async {
//     final Email email = Email(
//       body: _bodyController.text,
//       subject: _subjectController.text,
//       recipients: [_recipientController.text],
//       attachmentPaths: attachments,
//       isHTML: isHTML,
//     );

//     String platformResponse;

//     try {
//       await FlutterEmailSender.send(email);
//       platformResponse = 'success';
//     } catch (error) {
//       print(error);
//       platformResponse = error.toString();
//     }

//     if (!mounted) return;

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(platformResponse),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Plugin example app'),
//         actions: <Widget>[
//           IconButton(
//             onPressed: send,
//             icon: Icon(Icons.send),
//           )
//         ],
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _recipientController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Recipient',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _subjectController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Subject',
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: _bodyController,
//                   maxLines: null,
//                   expands: true,
//                   textAlignVertical: TextAlignVertical.top,
//                   decoration: InputDecoration(
//                       labelText: 'Body', border: OutlineInputBorder()),
//                 ),
//               ),
//             ),
//             CheckboxListTile(
//               contentPadding:
//                   EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
//               title: Text('HTML'),
//               onChanged: (bool? value) {
//                 if (value != null) {
//                   setState(() {
//                     isHTML = value;
//                   });
//                 }
//               },
//               value: isHTML,
//             ),
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Column(
//                 children: <Widget>[
//                   for (var i = 0; i < attachments.length; i++)
//                     Row(
//                       children: <Widget>[
//                         Expanded(
//                           child: Text(
//                             attachments[i],
//                             softWrap: false,
//                             overflow: TextOverflow.fade,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.remove_circle),
//                           onPressed: () => {_removeAttachment(i)},
//                         )
//                       ],
//                     ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: IconButton(
//                       icon: Icon(Icons.attach_file),
//                       onPressed: _openImagePicker,
//                     ),
//                   ),
//                   TextButton(
//                     child: Text('Attach file in app documents directory'),
//                     onPressed: () => _attachFileFromAppDocumentsDirectoy(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _openImagePicker() async {
//     final picker = ImagePicker();
//     PickedFile? pick = await picker.getImage(source: ImageSource.gallery);
//     if (pick != null) {
//       setState(() {
//         attachments.add(pick.path);
//       });
//     }
//   }

//   void _removeAttachment(int index) {
//     setState(() {
//       attachments.removeAt(index);
//     });
//   }

//   Future<void> _attachFileFromAppDocumentsDirectoy() async {
//     try {
//       final appDocumentDir = await getApplicationDocumentsDirectory();
//       final filePath = appDocumentDir.path + '/file.txt';
//       final file = File(filePath);
//       await file.writeAsString('Text file in app directory');

//       setState(() {
//         attachments.add(filePath);
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Failed to create file in applicion directory'),
//         ),
//       );
//     }
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_turtle/flutter_turtle.dart';

// import 'package:flutter/material.dart';
// import 'package:hand_signature/signature.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return;
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Turtle Tutorial')),
//       body: TurtleView(
//         child: Container(),
//         commands: [
//           // PenDown(),
//           // SetColor((_) => Color.fromARGB(255, 93, 86, 235)),
//           // SetStrokeWidth((_) => 2),
//           // Repeat((_) => 20, [
//           //   Repeat((_) => 180, [
//           //     Forward((_) => 25.0),
//           //     Right((_) => 20),
//           //   ]),
//           //   Right((_) => 18),
//           // ]),
//           // PenUp(),
//           PenDown(),
//           SetColor((_) => Colors.black),
//           SetStrokeWidth((_) => 2),
//           Repeat((_) => 4, [Forward((_) => 50), Right((_) => 90)]),
//           PenUp(),
//           Forward((_) => 80),
//           PenDown(),
//           SetColor((_) => Colors.black),
//           SetStrokeWidth((_) => 2),
//           Repeat((_) => 4, [Forward((_) => 50), Right((_) => 90)]),
//           PenUp(),
//         ],
//       ),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Smooth Hand Signature')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 500,
//               width: 300,
//               color: Colors.black26,
//               child: HandSignature(
//                 color: Colors.red,
//                 control: HandSignatureControl(),
//               ),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   setState(() {});
//                 },
//                 child: Text("Reset Signature")),
//           ],
//         ),
//       ),
//     );
//   }
// }

///////////////////////////////////////////////////////////////////////////////////////////////

// FLUTTER NEUMORPHIC APP CODE,-

// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return NeumorphicApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       themeMode: ThemeMode.light,
//       theme: NeumorphicThemeData(
//         // baseColor: Colors.blueAccent,
//         baseColor: Colors.white,
//         lightSource: LightSource.topLeft,
//         depth: 5,
//       ),
//       darkTheme: NeumorphicThemeData(
//         baseColor: Color(0xFF3E3E3E),
//         lightSource: LightSource.topLeft,
//         depth: 10,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SizedBox(
//               height: 30,
//             ),
//             NeumorphicButton(
//               onPressed: () {},
//               child: Icon(Icons.arrow_back_ios_new),
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.flat,
//                 boxShape: NeumorphicBoxShape.circle(),
//               ),
//             ),
//             Neumorphic(
//               margin: EdgeInsets.all(30),
//               style: NeumorphicStyle(
//                 shape: NeumorphicShape.flat,
//                 boxShape:
//                     NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
//               ),
//               child: Container(
//                 height: MediaQuery.of(context).size.height / 1.4,
//                 child: Neumorphic(
//                   child: TextField(style: Neu,),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class MyHomePage extends StatelessWidget {
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: NeumorphicFloatingActionButton(
// //         child: Icon(Icons.add, size: 30),
// //         onPressed: () {},
// //       ),
// //       backgroundColor: NeumorphicTheme.baseColor(context),
// //       body: Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: <Widget>[
// //             NeumorphicButton(
// //               onPressed: () {
// //                 print("onClick");
// //               },
// //               style: NeumorphicStyle(
// //                 shape: NeumorphicShape.flat,
// //                 boxShape: NeumorphicBoxShape.circle(),
// //               ),
// //               padding: const EdgeInsets.all(12.0),
// //               child: Icon(
// //                 Icons.favorite_border,
// //                 color: _iconsColor(context),
// //               ),
// //             ),
// //             NeumorphicButton(
// //                 margin: EdgeInsets.only(top: 12),
// //                 onPressed: () {
// //                   NeumorphicTheme.of(context)!.themeMode =
// //                       NeumorphicTheme.isUsingDark(context)
// //                           ? ThemeMode.light
// //                           : ThemeMode.dark;
// //                 },
// //                 style: NeumorphicStyle(
// //                   shape: NeumorphicShape.flat,
// //                   boxShape:
// //                       NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
// //                 ),
// //                 padding: const EdgeInsets.all(12.0),
// //                 child: Text(
// //                   "Toggle Theme",
// //                   style: TextStyle(color: _textColor(context)),
// //                 )),
// //             // NeumorphicButton(
// //             //     margin: EdgeInsets.only(top: 12),
// //             //     onPressed: () {
// //             //       Navigator.of(context)
// //             //           .pushReplacement(MaterialPageRoute(builder: (context) {
// //             //         return FullSampleHomePage();
// //             //       }));
// //             //     },
// //             //     style: NeumorphicStyle(
// //             //       shape: NeumorphicShape.flat,
// //             //       boxShape:
// //             //           NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
// //             //       //border: NeumorphicBorder()
// //             //     ),
// //             //     padding: const EdgeInsets.all(12.0),
// //             //     child: Text(
// //             //       "Go to full sample",
// //             //       style: TextStyle(color: _textColor(context)),
// //             //     )),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Color? _iconsColor(BuildContext context) {
// //     final theme = NeumorphicTheme.of(context);
// //     if (theme!.isUsingDark) {
// //       return theme.current!.accentColor;
// //     } else {
// //       return null;
// //     }
// //   }

// //   Color _textColor(BuildContext context) {
// //     if (NeumorphicTheme.isUsingDark(context)) {
// //       return Colors.white;
// //     } else {
// //       return Colors.black;
// //     }
// //   }
// // }

// //////////////////////////////////////////////////////////////////////////////////
//  CODE FOR WEB_SCRAPER ,--
import 'package:web_scraper/web_scraper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';

void main() => runApp(WebScraperApp());

class WebScraperApp extends StatefulWidget {
  @override
  _WebScraperAppState createState() => _WebScraperAppState();
}

class _WebScraperAppState extends State<WebScraperApp> {
  // initialize WebScraper by passing base url of website
  final webScraper = WebScraper('https://webscraper.io');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>>? productNames;
  late List<Map<String, dynamic>> productDescriptions;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper
        .loadWebPage('/test-sites/e-commerce/allinone/computers/laptops')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement(
            'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
        productDescriptions = webScraper.getElement(
            'div.thumbnail > div.caption > p.description', ['title']);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Requesting to fetch before UI drawing starts
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Catalog'),
        ),
        body: SafeArea(
          child: productNames == null
              ? Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : ListView.builder(
                  itemCount: productNames!.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.
                    Map<String, dynamic> attributes =
                        productNames![index]['attributes'];
                    return ExpansionTile(
                      title: Text(attributes['title']),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child:
                                    Text(productDescriptions[index]['title']),
                                margin: EdgeInsets.only(bottom: 10.0),
                              ),
                              InkWell(
                                onTap: () {
                                  // uses UI Launcher to launch in web browser & minor tweaks to generate url
                                  launch(
                                      webScraper.baseUrl! + attributes['href']);
                                },
                                child: Text(
                                  'View Product',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
