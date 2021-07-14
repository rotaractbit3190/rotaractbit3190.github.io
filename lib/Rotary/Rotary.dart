import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';

class Rotary extends StatefulWidget {
  @override
  _RotaryState createState() => _RotaryState();
}

class _RotaryState extends State<Rotary> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List _isHovering = [false, false, false, false, false, false, false];
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _scrollListener();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: isScreenSmall
          ? AppBar(
              title: Image.asset(
                'title_logo.png',
                fit: BoxFit.contain,
                height: screenSize.height * 0.08,
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, screenSize.height * 0.15),
              child: Card(
                color: Colors.grey[900].withOpacity(_opacity),
                elevation: 10,
                child: Container(
                  color: Colors.grey[900].withOpacity(_opacity),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: screenSize.width * 0.1),
                    child: Row(
                      children: [
                        Image.asset('title_logo.png', height: 250.0),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[0] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Home',
                                  style: TextStyle(
                                      color: _isHovering[0]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontFamily: 'Montserrat',
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/events');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[1] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Events',
                                  style: TextStyle(
                                      color: _isHovering[1]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/rotary');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[2] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Rotary',
                                  style: TextStyle(
                                      color: _isHovering[2]
                                          ? Colors.pink
                                          : Colors.orange,
                                      decoration: TextDecoration.underline,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/board');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[3] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Board',
                                  style: TextStyle(
                                      color: _isHovering[3]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(width: screenSize.width / 20),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/contact_us');
                                },
                                onHover: (ishoverd) {
                                  setState(() {
                                    _isHovering[4] = ishoverd;
                                  });
                                },
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      color: _isHovering[4]
                                          ? Colors.pink
                                          : Colors.orange,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                        ),
                        themeChange.isSignedIn
                            ? DropdownButton<String>(
                                // value: themeChange.username!=null && !themeChange.username.isEmpty?themeChange.username:'Loading',
                                iconSize: 0,
                                value: "DashBoard",
                                elevation: 8,
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    if (val.compareTo("Sign Out") == 0) {
                                      Database("", "", "", "", "", "")
                                          .signOut();
                                      themeChange.username = "";
                                      themeChange.email = "";
                                      themeChange.isSignedIn = false;
                                    } else if (val.compareTo("DashBoard") == 0)
                                      Navigator.pushNamed(
                                          context, '/dashboard');
                                  });
                                },
                                style: GoogleFonts.montserrat(
                                  color: Colors.orange,
                                ),
                                items: <String>[
                                  'DashBoard',
                                  'Sign Out'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            : Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _launchURL(
                                          'https://rzp.io/l/rotaractRegistration');
                                    },
                                    onHover: (val) {
                                      setState(() {
                                        _isHovering[5] = val;
                                      });
                                    },
                                    child: Text(
                                      "Register",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          color: _isHovering[5]
                                              ? Colors.pink
                                              : Colors.orange,
                                          fontSize: 17),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    onHover: (val) {
                                      setState(() {
                                        _isHovering[6] = val;
                                      });
                                    },
                                    child: Text(
                                      "Log In",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          color: _isHovering[6]
                                              ? Colors.pink
                                              : Colors.orange,
                                          fontSize: 17),
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(width: screenSize.width * 0.01),
                        IconButton(
                          icon: Icon(Icons.brightness_medium,
                              color: themeChange.darkTheme
                                  ? Colors.white
                                  : Colors.grey[400]),
                          onPressed: () {
                            themeChange.darkTheme = !themeChange.darkTheme;
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
      drawer: isScreenSmall
          ? Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      children: [
                        Image.asset('assets/title_logo.png',
                            height: 120.0, width: 250.0, scale: 0.1),
                        Text('Rotaract Club of BIT'),
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: themeChange.darkTheme
                            ? Colors.grey[400]
                            : Colors.grey[900],
                        shape: BoxShape.rectangle),
                  ),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                  ListTile(
                    title: Text('Rotary'),
                    leading: Icon(Icons.settings, color: Colors.orange),
                    onTap: () {
                      Navigator.pushNamed(context, '/rotary');
                    },
                    focusColor: Colors.grey[600],
                  ),
                  ListTile(
                    title: Text('Events'),
                    leading: Icon(Icons.calendar_today),
                    onTap: () {
                      Navigator.pushNamed(context, '/events');
                    },
                  ),
                  ListTile(
                    title: Text('Board'),
                    leading: Icon(Icons.people),
                    onTap: () {
                      Navigator.pushNamed(context, '/board');
                    },
                  ),
                  ListTile(
                    title: Text('Contact us'),
                    leading: Icon(Icons.contact_mail),
                    onTap: () {
                      Navigator.pushNamed(context, '/contact_us');
                    },
                  ),
                  themeChange.isSignedIn
                      ? Column(
                          children: [
                            ListTile(
                              title: Text('DashBoard'),
                              leading: Icon(Icons.person),
                              onTap: () {
                                Navigator.pushNamed(context, '/dashboard');
                              },
                            ),
                            ListTile(
                              title: Text('Sign Out'),
                              leading: Image.network(
                                  'https://img.icons8.com/fluent-systems-regular/24/000000/exit.png'),
                              onTap: () {
                                Database("", "", "", "", "", "").signOut();
                                themeChange.username = "";
                                themeChange.email = "";
                                themeChange.isSignedIn = false;
                              },
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            ListTile(
                              title: Text('Register'),
                              leading: Icon(Icons.person_add),
                              onTap: () {
                                _launchURL(
                                    'https://rzp.io/l/rotaractRegistration');
                              },
                            ),
                            ListTile(
                              title: Text('Log In'),
                              leading: Icon(Icons.person),
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                            ),
                          ],
                        ),
                ],
              ),
            )
          : null,
      // extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,

      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.4,
              child: themeChange.darkTheme
                  ? Image.asset('rcbit_logo.png')
                  : Image.asset('blue_rcbit_logo.png'),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              // color: Theme.of(context).backgroundColor,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: isScreenSmall
                            ? screenSize.height * 0.3
                            : screenSize.height * 0.45,
                        width: screenSize.width,
                        child: Image.asset(
                            themeChange.darkTheme
                                ? 'celeberation_image.webp'
                                : 'celeberation_image_orange.webp',
                            fit: isScreenSmall ? BoxFit.fill : BoxFit.cover),
                      )
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: screenSize.height * 0.01,
                          horizontal:
                              isScreenSmall ? 16 : screenSize.width * 0.2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('rotary_international.png',
                              fit: BoxFit.contain, width: 450.0, scale: 0.01),
                          SizedBox(height: 50.0),
                          Container(
                            color: Theme.of(context).buttonColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 11.0),
                            child: FlatButton(
                              onPressed: () {
                                _launchURL('https://rotary.org');
                              },
                              child: Text(
                                'Rotary International',
                                style: TextStyle(
                                    color: themeChange.darkTheme
                                        ? Colors.orange
                                        : Color(0xff3B3B3B),
                                    fontSize: 20.0,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Text(
                              'Rotary was founded in the early 1900s in Chicago Illinois by Paul Harris. The origin of the name is that the meetings would rotate between the Members of individual offices, once the club became too big for this they chose a permanent location for their meetings. Rotary is divided into a federalist or charter system with 35,000 clubs that meet every week all around the world; 530 districts that manage individual clubs, charter new ones, and maintain the link between Rotary International and the clubs. Moreover, there are 34 zones that break up the world in manageable chunks and help with some of the international functions as well as the infrastructure needed by the districts and clubs.',
                              style: GoogleFonts.poppins(
                                  // fontFamily: 'Bahnschrift',
                                  //sans can also be tried
                                  fontSize: 20.0,
                                  letterSpacing: 0.5,
                                  color: themeChange.darkTheme
                                      ? Colors.grey[400]
                                      : Colors.grey[900])),
                          SizedBox(height: 100.0),
                          Image.asset('rbse_logo.png',
                              width: 450.0, fit: BoxFit.contain, scale: 0.01),
                          Container(
                            color: Theme.of(context).buttonColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 11.0),
                            child: FlatButton(
                              onPressed: () {
                                _launchURL(
                                    'https://www.instagram.com/p/CCymeL_gJEv/');
                              },
                              child: Text(
                                'Rotary Bangalore Agneya',
                                style: TextStyle(
                                  fontFamily: 'Bahnschrift',
                                  //sans can also be tried
                                  fontSize: 20.0,
                                  letterSpacing: 0.5,
                                  color: themeChange.darkTheme
                                      ? Colors.orange
                                      : Color(0xff3B3B3B),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Text(
                              "Rotary Bangalore Agneya (RBA) is a club under the umbrella of Rotary International, a non-profit organization. Rotary International is perhaps the largest collection of organized volunteers in the world. Rotary International is divided into districts, which are then sub-divided into clubs.\nRBSE was chartered in the year 2000 as a Rotary club, a mark to begin the millennium. The club today, has 30 members and over the years executed thousands of non-profit projects along with its various youth wings.\nCurrently, the youth wings under RBSE are:",
                              style: GoogleFonts.poppins(
                                  // fontFamily: 'Bahnschrift',
                                  //sans can also be tried
                                  fontSize: 20.0,
                                  letterSpacing: 0.5,
                                  color: themeChange.darkTheme
                                      ? Colors.grey[400]
                                      : Colors.grey[900])),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isScreenSmall
                                    ? 16
                                    : screenSize.width * 0.04),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('1. Rotaract Club of Bangalore B.I.T.',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 24,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                                Text(
                                    '2. Rotaract Club of Bangalore South East.',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 24,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                                Text(
                                    '3. Interact club of Shantiniketan Educational Institutions.',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 24,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "We at RBSE, have been instrumental in many signature projects along with our enthusiastic youth wings. Some of them are:-",
                              style: GoogleFonts.poppins(
                                  // fontFamily: 'Bahnschrift',
                                  //sans can also be tried
                                  fontSize: 20.0,
                                  letterSpacing: 0.5,
                                  color: themeChange.darkTheme
                                      ? Colors.grey[400]
                                      : Colors.grey[900])),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isScreenSmall
                                    ? 16
                                    : screenSize.width * 0.04,
                                vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: Text(
                                      '1. PRISM(Pro-active Rotary Innovative Science and Math) centres in Government High Schools. Read More...',
                                      style: GoogleFonts.robotoCondensed(
                                          // fontFamily: 'Bahnschrift',
                                          //sans can also be tried
                                          fontSize: 22,
                                          letterSpacing: 0.8,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900])),
                                  onHover: null,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/prism');
                                  },
                                ),
                                Text(
                                    '2. SME(Small and medium-sized enterprises) awards',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 22,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                                Text(
                                    '3. Musical Concerts- RB Burman team, SP Balasubhramanyam etc.',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 22,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                                Text(
                                    '4. NID (National Immunization Day): Eradication of Polio through yearly pulse polio drive.',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 22,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                                Text(
                                    '5. Teachers Recognitions: Nation Builder Award, Gurudakshine',
                                    style: GoogleFonts.robotoCondensed(
                                        // fontFamily: 'Bahnschrift',
                                        //sans can also be tried
                                        fontSize: 22,
                                        letterSpacing: 0.8,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900])),
                              ],
                            ),
                          ),
                          Text(
                              "Similarly, each of our youth wings have their own projects that happen every year with a fresh Board of Directors. The board is formed internally by the students or the teachers and an experience of professionalism and philanthropy follows during their tenure.\nRBSE will always strive to make the world a joyous place for everyone, irrespective of religion, colour, gender or age. The lasting impression Rotary imbibes on its members, youth participants, volunteers and teachers is truly remarkable and a driving factor in all our philanthropic and personal successes. Join us, on this wonderful journey that lasts a lifetime to change innumerable lives for the better.",
                              style: GoogleFonts.poppins(
                                  // fontFamily: 'Bahnschrift',
                                  //sans can also be tried
                                  fontSize: 20.0,
                                  letterSpacing: 0.5,
                                  color: themeChange.darkTheme
                                      ? Colors.grey[400]
                                      : Colors.grey[900])),
                          SizedBox(height: 100.0),
                          Image.asset('title_logo.png',
                              width: 650.0, scale: 0.01),
                          Container(
                            color: Theme.of(context).buttonColor,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 11.0),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, '/');
                              },
                              child: Text(
                                'Rotaract Club of Bangalore B.I.T.',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: themeChange.darkTheme
                                      ? Colors.orange
                                      : Color(0xff3B3B3B),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Text(
                              "Rotaract Club of Bangalore BIT was founded in 2011. It is a part of global effort to bring peace and happiness though service, by the students of Bangalore Institute of Technology, with the support of Rotaract. It is affiliated to Rotary International District 3190 and it’s one of the most active clubs in the college which brings together students to take action in their communities, develop their leadership and professional skills. The club is sponsored by Rotary Bangalore Agneya, our parent Rotary Club. Our club gives an opportunity to connect with young leaders in the community, while simultaneously building personal skills.",
                              style: GoogleFonts.poppins(
                                  // fontFamily: 'Bahnschrift',
                                  //sans can also be tried
                                  fontSize: 20.0,
                                  letterSpacing: 0.5,
                                  color: themeChange.darkTheme
                                      ? Colors.grey[400]
                                      : Colors.grey[900])),
                          SizedBox(height: 100.0),
                        ],
                      ),
                    ),
                  ),
                  Footer()
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: isScreenSmall
          ? FloatingActionButton(
              backgroundColor:
                  themeChange.darkTheme ? Colors.grey : Colors.black12,
              onPressed: () {
                themeChange.darkTheme = !themeChange.darkTheme;
              },
              child: Icon(Icons.brightness_medium,
                  color:
                      themeChange.darkTheme ? Colors.white : Colors.grey[800]),
            )
          : null,
    );
  }
}
