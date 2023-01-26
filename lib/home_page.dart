import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo2/info/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final Uri _urlTel = Uri.parse('tel:4441603');
final Uri _urlEposta = Uri.parse('mailto:nilufer@nilufer.bel.tr');

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SizedBox(
            height: size.height * 1,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.06,
                width: size.width * 1,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                          height: size.height * 0.045,
                          width: size.width * 0.09,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(
                                      -2,
                                      -2,
                                    ),
                                    blurRadius: 50,
                                    blurStyle: BlurStyle.inner)
                              ]),
                          child: IconButton(
                              onPressed: _launchEposta,
                              icon: Icon(
                                Icons.mail,
                                size: 20,
                                color: Colors.cyan[900],
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                          height: size.height * 0.045,
                          width: size.width * 0.09,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(
                                      -2,
                                      -2,
                                    ),
                                    blurRadius: 50,
                                    blurStyle: BlurStyle.inner)
                              ]),
                          child: IconButton(
                              onPressed: _launchTel,
                              icon: Icon(
                                Icons.phone,
                                size: 20,
                                color: Colors.cyan[900],
                              ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('items').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const LinearProgressIndicator();
                }
                if (snapshot.hasError) {
                  debugPrint('erorrrrr ${snapshot.error}');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.of(
                        context,
                      ).push(
                          CupertinoPageRoute(builder: (BuildContext context) {
                        //    for (int i = 0; i < page.length; i++) return page[i];
                        return page[index];
                      })),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withAlpha(110)),
                            height: size.height * 0.08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Image.network(
                                  ds['icon'].toString(),
                                  height: size.height * 0.07,
                                  width: size.width * 0.09,
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Container(
                                  decoration: const BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0.5, 0.5),
                                        blurRadius: 5.0,
                                        spreadRadius: 1.0,
                                        blurStyle: BlurStyle.inner)
                                  ]),
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Text(
                                  ds['name'].toString(),
                                  style: const TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                    height: size.height * 0.20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        "assets/images/logo2.png",
                        height: size.height * 0.15,
                        width: size.width * 0.4,
                        fit: BoxFit.contain,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _launchTel() async {
  if (!await launchUrl(_urlTel)) {
    throw 'Could not launch $_urlTel';
  }
}

Future<void> _launchEposta() async {
  if (!await launchUrl(_urlEposta)) {
    throw 'Could not launch $_urlEposta';
  }
}
