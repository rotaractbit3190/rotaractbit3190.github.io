import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact_us extends StatefulWidget {
  @override
  _Contact_usState createState() => _Contact_usState();
}

class _Contact_usState extends State<Contact_us> {
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
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: isScreenSmall
          ? AppBar(
              title: Image.asset(
                'title_logo.png',
                fit: BoxFit.contain,
                height: screenSize.height * 0.08,
              ),
              backgroundColor: Colors.grey.withOpacity(_opacity),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, screenSize.height * 0.15),
              child: Card(
                elevation: 10,
                color: Colors.grey[900].withOpacity(_opacity),
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
                                      decoration: TextDecoration.underline,
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
                    leading: Icon(Icons.settings),
                    onTap: () {
                      Navigator.pushNamed(context, '/rotary');
                    },
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
                    leading: Icon(
                      Icons.contact_mail,
                      color: Colors.orange,
                    ),
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
                      padding: EdgeInsets.all(screenSize.width * 0.1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rotaract Club of Bangalore B.I.T. for you',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: themeChange.darkTheme
                                    ? Colors.grey[400]
                                    : Colors.grey[900]),
                          ),
                          SizedBox(height: screenSize.height * 0.05),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.pink,
                                child: IconButton(
                                    icon: Icon(
                                  Icons.location_on,
                                  color: themeChange.darkTheme
                                      ? Colors.grey[400]
                                      : Colors.white,
                                  size: 30,
                                )),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              Text(
                                isScreenSmall
                                    ? 'Bangalore Institute of\nTechnology, KR Road, \nVV Puram, Bengaluru-560002'
                                    : 'Bangalore Institute of Technology, KR Road, VV puram, Bengaluru-560002',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20,
                                    color: themeChange.darkTheme
                                        ? Colors.grey[400]
                                        : Colors.grey[900]),
                              )
                            ],
                          ),
                          //TODO : Name to be added manish and rohan and remove whatsapp
                          SizedBox(height: screenSize.height * 0.02),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 30,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: themeChange.darkTheme
                                        ? Colors.grey[400]
                                        : Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    _launchURL('tel:9199348774');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rtr. Rohan Verma',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900]),
                                  ),
                                  InkWell(
                                    child: Text(
                                      '+91-9199348774',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onTap: () {
                                      _launchURL('tel:9199348774');
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 30,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.call,
                                    color: themeChange.darkTheme
                                        ? Colors.grey[400]
                                        : Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    _launchURL('tel:6362796957');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Rtr. Manish Rakshith',
                                    style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900]),
                                  ),
                                  InkWell(
                                    child: Text(
                                      '+91-6362796957',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onTap: () {
                                      _launchURL('tel:6362796957');
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: screenSize.height * 0.02),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.pink,
                                radius: 30,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.email,
                                    color: themeChange.darkTheme
                                        ? Colors.grey[400]
                                        : Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    _launchURL('mailto:bitrotaract@gmail.com');
                                  },
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * 0.01,
                              ),
                              SelectableText(
                                'bitrotaract@gmail.com',
                                style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    color: themeChange.darkTheme
                                        ? Colors.grey[400]
                                        : Colors.grey[900]),
                              )
                            ],
                          ),
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
