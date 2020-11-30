import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'bottomBarColumn.dart';
class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width<800;
    return Container(
      padding: EdgeInsets.all(30.0),
      color: Colors.blueGrey[800],
      child: isScreenSmall? Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarColumn(
                // heading: 'About Us',
                s1: 'Contact Us',
                // s2: 'About Us',
                s3: 'Why join Us',
              )
            ],
          ),
         
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/color/48/000000/instagram-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                  width: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.instagram.com/rotaractclubofbit/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/linkedin-2.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.linkedin.com/company/rotaractclubofbit/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/gmail.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('mailto:bitrotaract@gmail.com');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/twitter.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://twitter.com/RotaractBIT?s=08');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/facebook-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.facebook.com/rtctbit');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              )
            ],
          )
        ],
      ):Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        //Todo : remove about us and centre about us
        children: [
          Container(height: 125,
              child: Image.asset('title_logo.png')),

          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: BottomBarRow(
                  // heading: 'About Us',
                  s1: 'Contact Us',
                  //s2: 'About Us',
                  s3: 'Why join Us',
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // TODO : order of Gmail, linkedin, insta, whatsapp
            children: [
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/color/48/000000/instagram-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                  width: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.instagram.com/rotaractclubofbit/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/linkedin-2.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.linkedin.com/company/rotaractclubofbit/');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/gmail.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('mailto:bitrotaract@gmail.com');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/twitter.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://twitter.com/RotaractBIT?s=08');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              ),
              InkWell(
                child: Container(
                  child: Image.network('https://img.icons8.com/fluent/48/000000/facebook-new.png',
                      fit: BoxFit.cover),
                  height: screenSize.height*0.05,
                ),
                onTap: () {
                  _launchURL('https://www.facebook.com/rtctbit');
                },
                hoverColor: Colors.transparent,
              ),
              SizedBox(
                width: screenSize.width*0.02,
              )
              // InkWell(
              //   child: Container(
              //     child: Image.network('https://www.freepnglogos.com/download/2261',
              //         fit: BoxFit.cover),
              //     height: screenSize.height*0.05,
              //   ),
              //   onTap: () {
              //     _launchURL('https://instagram.com');
              //   },
              //   hoverColor: Colors.transparent,
              // ),
              // SizedBox(
              //   width: screenSize.width*0.02,
              // )
            ],
          )
        ],
      ),
    );
  }
}
