import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_scrollbar/flutter_web_scrollbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/home/imageCarousal.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

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

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _scrollController.position.moveTo(dragUpdate.globalPosition.dy * 3.5);
    });
  }

  List _isHovering_people = [false, false];
  List _isHovering = [false, false, false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width < 800;
    _opacity = _scrollPosition < screenSize.height * 0.4 ? 0.75 : 1.0;
    // print(screenSize.height*0.45);
    // print(screenSize.width);
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
                        vertical: 0, horizontal: screenSize.width * 0.1),
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
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline),
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
                                      fontWeight: FontWeight.w600
                                      //decoration: TextDecoration.underline
                                      ),
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
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0),
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
                    leading: Icon(Icons.home, color: Colors.orange),
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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: Stack(children: [
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
                        child: SizedBox(
                          width: screenSize.width,
                          height: isScreenSmall
                              ? screenSize.height * 0.3
                              : screenSize.height * 0.45,
                          child: Image.asset(
                              themeChange.darkTheme
                                  ? 'celeberation_image.webp'
                                  : 'celeberation_image_orange.webp',
                              fit: isScreenSmall ? BoxFit.fill : BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: isScreenSmall
                            ? screenSize.height * 0.05
                            : screenSize.height * 0.1,
                        horizontal: screenSize.width * 0.1),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: isScreenSmall
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        // Center(
                        //   child: InkWell(
                        //     child: Text(
                        //       'Our Events',
                        //       style: GoogleFonts.montserrat(
                        //           fontSize: 40,
                        //           fontWeight: FontWeight.w400,
                        //           color: themeChange.darkTheme?Colors.orange[400]:Colors.blue
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Expanded(
                        //   child: Text(
                        //
                        //     textAlign: TextAlign.end,
                        //     style: GoogleFonts.montserrat(
                        //       fontSize: 20,
                        //         color: themeChange.darkTheme?Colors.orange[400]:Colors.blue
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  // Container(
                  //   color: Theme.of(context).buttonColor,
                  //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.0),
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/cybersec');
                  //     },
                  //     child: Text(
                  //       'Click here for registration in CyberSec (Webinar)',
                  //       style: TextStyle(
                  //           color: themeChange.darkTheme?Colors.orange:Color(0xff3B3B3B),
                  //           fontSize: isScreenSmall?20:60.0,
                  //           letterSpacing: 1.5
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 50.0),
                  // Container(
                  //   color: Theme.of(context).buttonColor,
                  //   padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 11.0),
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       launch('https://pages.razorpay.com/rcbitCyberSecurity');
                  //     },
                  //     child: Text(
                  //       'Click here for registration in CyberSec 2.0 (Workshop)',
                  //       style: TextStyle(
                  //           color: themeChange.darkTheme?Colors.orange:Color(0xff3B3B3B),
                  //           fontSize: isScreenSmall?20:60.0,
                  //           letterSpacing: 1.5
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 50.0),
                  Container(
                    child: ImageCarousal(),
                    height: isScreenSmall
                        ? screenSize.height * 0.3
                        : screenSize.height * 0.7,
                  ),
                  SizedBox(height: isScreenSmall ? 0 : screenSize.height * 0.1),
                  isScreenSmall
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              onHover: (isHover) {
                                setState(() {
                                  _isHovering_people[0] = isHover;
                                });
                              },
                              child: Card(
                                elevation: _isHovering_people[0] ? 20 : 0,
                                shadowColor: themeChange.darkTheme
                                    ? Colors.blue
                                    : Colors.orange,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        'rotary_pres.jpg',
                                        height: screenSize.height * 0.3,
                                        width: screenSize.width * 0.7,
                                      ),
                                    ),
                                    Container(
                                      color: themeChange.darkTheme
                                          ? Colors.blue
                                          : Colors.orange,
                                      width: screenSize.width * 0.7,
                                      height: screenSize.height * 0.08,
                                      child: Center(
                                        child: Text(
                                          'Rtn. K.S. Guruprasad',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.monda(
                                              fontSize: 22.0,
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Colors.grey[900]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.01,
                            ),
                            InkWell(
                              onTap: () {},
                              onHover: (isHover) {
                                setState(() {
                                  _isHovering_people[0] = isHover;
                                });
                              },
                              child: Card(
                                elevation: _isHovering_people[0] ? 20 : 0,
                                shadowColor: themeChange.darkTheme
                                    ? Colors.blue
                                    : Colors.orange,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        'principal.jpg',
                                        height: screenSize.height * 0.3,
                                        width: screenSize.width * 0.7,
                                      ),
                                    ),
                                    Container(
                                      color: themeChange.darkTheme
                                          ? Colors.blue
                                          : Colors.orange,
                                      width: screenSize.width * 0.7,
                                      height: screenSize.height * 0.08,
                                      child: Center(
                                        child: Text(
                                          'Rtn. Dr. Ashwath MU',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.monda(
                                              fontSize: 22.0,
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Colors.grey[900]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              onHover: (isHover) {
                                setState(() {
                                  _isHovering_people[0] = isHover;
                                });
                              },
                              child: Card(
                                elevation: _isHovering_people[0] ? 20 : 0,
                                shadowColor: themeChange.darkTheme
                                    ? Colors.blue
                                    : Colors.orange,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        'rotary_pres.jpg',
                                        height: screenSize.height * 0.5,
                                        width: screenSize.width * 0.2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      color: themeChange.darkTheme
                                          ? Colors.blue
                                          : Colors.orange,
                                      width: screenSize.width * 0.2,
                                      height: screenSize.height * 0.1,
                                      child: Center(
                                        child: Text(
                                          'Rtn. K.S. Guruprasad',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.monda(
                                              fontSize: 22.0,
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Colors.grey[900]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              onHover: (isHover) {
                                setState(() {
                                  _isHovering_people[1] = isHover;
                                });
                              },
                              child: Card(
                                elevation: _isHovering_people[1] ? 20 : 0,
                                shadowColor: themeChange.darkTheme
                                    ? Colors.blue
                                    : Colors.orange,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        'principal.jpg',
                                        height: screenSize.height * 0.5,
                                        width: screenSize.width * 0.2,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      color: themeChange.darkTheme
                                          ? Colors.blue
                                          : Colors.orange,
                                      width: screenSize.width * 0.2,
                                      height: screenSize.height * 0.1,
                                      child: Center(
                                        child: Text(
                                          'Rtn. Dr. Ashwath MU',
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.monda(
                                              fontSize: 22.0,
                                              color: themeChange.darkTheme
                                                  ? Colors.white
                                                  : Colors.grey[900]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.05,
                        horizontal: screenSize.width * 0.1),
                    child: Column(
                      //column for 'About Us'
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Theme',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              fontSize: 44,
                              color: themeChange.darkTheme
                                  ? Colors.orange[400]
                                  : Colors.blue),
                        ),
                        SizedBox(height: screenSize.height * 0.01),
                        Text(
                          'AIM TO BE EXCEPTIONAL',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                              fontSize: 31,
                              color: themeChange.darkTheme
                                  ? Colors.blue[400]
                                  : Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenSize.height * 0.01),
                        Text(
                          "We, the team of Rotaract Club of Bangalore B.I.T. have decided the theme of the Rotayear 2020-21 to be “Aim to Be Exceptional”. We believe in standing out as exceptional. The brilliant team we have this year has unique talents. Shining like a bright unicorn with the horn as our guiding spirit, we would be developing leadership and bravery. With optimistic spirits and unity, we wish to prove ourselves to be extraordinary. Sticking to roots yet flying high above is what we mean by our logo, the Unicorn. We are aiming for an exclusive Rotayear. As galant and proud as a unicorn, our club is ready for this upcoming joyride of Rotaract. \n We, Aim to Be Exceptional.",
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: themeChange.darkTheme
                                  ? Colors.grey[400]
                                  : Colors.grey[900]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'About Us',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.montserrat(
                            fontSize: 44,
                            // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                            color: themeChange.darkTheme
                                ? Colors.orange[400]
                                : Colors.blue,
                          ),
                        ),
                        Text(
                          "The Rotaract Club is an excellent way of meeting new people on a semi-formal platform and network while having fun - doing social service. Rotaract Club of Bangalore B.I.T. was founded in 2011. It is a part of global effort to bring peace and happiness though service, by the students of B.I.T. Bangalore, with the support of Rotaract. It is affiliated to Rotary International District 3190 and it’s one of the most active clubs in the college which brings together students to take action in their communities.The club is sponsored by Rotary Bangalore South East, our Parent Rotary Club. Goals of RCBIT-",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                            color: themeChange.darkTheme
                                ? Colors.grey[400]
                                : Colors.grey[900],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: screenSize.height * 0.02,
                              horizontal: screenSize.width * 0.04),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900],
                                        // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                                      ),
                                      children: [
                                    TextSpan(
                                        text: "1. Community Service: ",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                    TextSpan(
                                        text: "We believe in serving the community. The " +
                                            "team of RCBIT works in full force for the betterment of the " +
                                            "society and does the needful to the unprivileged.",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                        // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                        color: themeChange.darkTheme
                                            ? Colors.grey[400]
                                            : Colors.grey[900],
                                      ),
                                      children: [
                                    TextSpan(
                                        text: "2. Club Service: ",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                    TextSpan(
                                        text: "With activities on all levels, we focus on club " +
                                            "service as well. A healthy and friendly environment is " +
                                            "maintained within the club. Bonding and fellowships are " +
                                            "important to us.",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900]),
                                      children: [
                                    TextSpan(
                                        text: "3. International Service: ",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                    TextSpan(
                                        text: "Spreading wings and flying with glory is " +
                                            "what RCBIT aims for. We believe in expanding our boundaries " +
                                            "not only in the district but also globally. Friendship and " +
                                            "collaboration worldwide is what we specially take care of in " +
                                            "every Rota-Year.",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                  ])),
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900]),
                                      children: [
                                    TextSpan(
                                        text: "4. Professional Development: ",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                    TextSpan(
                                        text: "Growing with Rotaract is an " +
                                            "extraordinary process. Inculcating responsibility and pressure " +
                                            "management are the two things we definitely learn. Every " +
                                            "rotaractor plays an essential role in this development. Be it " +
                                            "building connections in the industry or among universities, we " +
                                            "focus on overall development of rotaractors.",
                                        style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: themeChange.darkTheme
                                              ? Colors.grey[400]
                                              : Colors.grey[900],
                                        )),
                                  ])),
                            ],
                          ),
                        ),
                        //ToDo : theme content
                      ],
                    ),
                  ),
                  Footer()
                ],
              ),
            ),
          ),
          // FlutterWebScroller(
          //     //Pass a reference to the ScrollCallBack function into the scrollbar
          //     scrollCallBack,

          //     //Add optional values
          //     scrollBarBackgroundColor: Colors.white,
          //     scrollBarWidth: 20.0,
          //     dragHandleColor: Colors.red,
          //     dragHandleBorderRadius: 2.0,
          //     dragHandleHeight: 40.0,
          //     dragHandleWidth: 15.0,
          //   ),
        ]),
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
