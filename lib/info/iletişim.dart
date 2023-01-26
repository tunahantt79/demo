import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IletisimPage extends StatefulWidget {
  const IletisimPage({super.key});

  @override
  State<IletisimPage> createState() => _IletisimPageState();
}

final Uri _urlTel = Uri.parse('tel:4441603');
final Uri _urlEposta = Uri.parse('mailto:nilufer@nilufer.bel.tr');

class _IletisimPageState extends State<IletisimPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.cyan[800],
                    child: const BackButton(
                      color: Colors.white,
                    ),
                  ),
                  Container(
                      color: Colors.white,
                      child: IconButton(
                          onPressed: () {
                            _launchTel();
                          },
                          icon: Icon(
                            Icons.phone,
                            size: 20,
                            color: Colors.cyan[900],
                          ))),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: GestureDetector(
                onTap: () {
                  _launchTel();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.phone,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '444 16 03',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {
                  _launchEposta();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Icon(
                            Icons.mail,
                            size: 25,
                            color: Colors.cyan.shade800,
                          ),
                        ),
                      ),
                      const Text(
                        'E-posta Gönder',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Haritada Göster',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () async {
                  const url = 'https://www.facebook.com/NiluferBel';

                  openBrowserURL(url: url, inApp: false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.facebook,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Facebook',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () async {
                  const url = 'https://twitter.com/NiluferBel';

                  openBrowserURL(url: url, inApp: false);
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/twitter.png')),
                      const Text(
                        'Twitter',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () async {
                  const url = 'https://twitter.com/NiluferBel';

                  openBrowserURL(url: url, inApp: false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red.shade800,
                  ),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/youtube.png')),
                      const Text(
                        'YouTube',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () async {
                  const url = 'https://www.instagram.com/niluferbel/';

                  openBrowserURL(url: url, inApp: false);
                },
                child: Container(
                  decoration: const BoxDecoration(),
                  height: size.height * 0.06,
                  width: size.width * 0.92,
                  child: Stack(fit: StackFit.expand, children: [
                    Image.asset(
                      'assets/images/indir.jpeg',
                      fit: BoxFit.fill,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset('assets/images/instagram.png')),
                        const Text(
                          'Instagram',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                  height: size.height * 0.09,
                  child: Image.asset("assets/images/logo2.png")),
            ),
          ],
        ),
      ]),
    );
  }

  Future openBrowserURL({required String url, bool inApp = false}) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url, forceWebView: inApp, enableJavaScript: true);
    }
  }

  Future<void> openYouTubeURL({required String url, bool inApp: false}) async {
    if (await canLaunch(url)) {
      await launch(url,
          forceSafariVC: inApp, forceWebView: inApp, enableJavaScript: true);
    }
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
