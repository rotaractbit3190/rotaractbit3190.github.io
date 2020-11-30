import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';

class Prism extends StatefulWidget {
  @override
  _PrismState createState() => _PrismState();
}

class _PrismState extends State<Prism> {

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
    _scrollController.addListener(() {_scrollListener();
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isScreenSmall = screenSize.width<800;
    _opacity = _scrollPosition<screenSize.height*0.4?0.75:1;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: isScreenSmall?AppBar(
        title: Image.asset('title_logo.png',
          fit: BoxFit.contain,
          height: screenSize.height*0.08,),
      ):PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height*0.15),
        child: Card(
          color: Colors.grey[900].withOpacity(_opacity),
          elevation: 10,
          child: Container(
            color: Colors.grey[900].withOpacity(_opacity),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical:20.0, horizontal: screenSize.width*0.1),
              child: Row(
                children: [
                  Image.asset('title_logo.png',
                      height: 250.0),
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
                                color: _isHovering[0]?Colors.pink:Colors.orange,
                                fontFamily: 'Montserrat',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width/20),
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
                                color: _isHovering[1]?Colors.pink:Colors.orange,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width/20),
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
                                color: _isHovering[2]?Colors.pink:Colors.orange,
                                decoration: TextDecoration.underline,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width/20),
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
                                color: _isHovering[3]?Colors.pink:Colors.orange,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width/20),
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
                                color: _isHovering[4]?Colors.pink:Colors.orange,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  themeChange.isSignedIn?DropdownButton<String>(
                    value: themeChange.username!=null && !themeChange.username.isEmpty?themeChange.username:'Loading',
                    iconSize: 0,
                    elevation: 8,
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (val) {
                      setState(() {
                        if(val.compareTo("Sign Out") == 0){
                          Database("","","","","","").signOut();
                          themeChange.username = "";
                          themeChange.email = "";
                          themeChange.isSignedIn = false;
                        }
                        else if(val.compareTo("DashBoard") == 0)
                          Navigator.pushNamed(context, '/dashboard');
                      });
                    },
                    style: GoogleFonts.montserrat(
                      color: Colors.orange,
                    ),
                    items: <String>['DashBoard', 'Sign Out',themeChange.username!=null && !themeChange.username.isEmpty?themeChange.username:'Loading' ]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ):Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        onHover: (val) {
                          setState(() {
                            _isHovering[5] = val;
                          });
                        },
                        child: Text("Register",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              color: _isHovering[5]?Colors.pink:Colors.orange,
                              fontSize: 17
                          ),),
                      ),
                      SizedBox(width: screenSize.width*0.01,),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        onHover: (val) {
                          setState(() {
                            _isHovering[6] = val;
                          });
                        },
                        child: Text("Log In",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.w400,
                              color: _isHovering[6]?Colors.pink:Colors.orange,
                              fontSize: 17
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width*0.01),
                  IconButton(
                    icon: Icon(Icons.brightness_medium,
                        color: themeChange.darkTheme?Colors.white:Colors.grey[400]),
                    onPressed: (){
                      themeChange.darkTheme = !themeChange.darkTheme;
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: isScreenSmall?Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset('assets/title_logo.png',
                      height: 120.0,
                      width: 250.0,
                      scale: 0.1),
                  Text('Rotaract Club of BIT'),
                ],
              ),
              decoration: BoxDecoration(
                  color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                  shape: BoxShape.rectangle
              ),
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
            themeChange.isSignedIn? Column(
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
                  leading: Image.network('https://img.icons8.com/fluent-systems-regular/24/000000/exit.png'),
                  onTap: () {
                    Database("","","","","","").signOut();
                    themeChange.username = "";
                    themeChange.email = "";
                    themeChange.isSignedIn = false;
                  },
                ),
              ],
            ):
            Column(
              children: [
                ListTile(
                  title: Text('Register'),
                  leading: Icon(Icons.person_add),
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
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
      ):null,
      // extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).backgroundColor,

      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.4,
              child: themeChange.darkTheme?Image.asset('rcbit_logo.png'):Image.asset('blue_rcbit_logo.png'),
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
                        height: isScreenSmall?screenSize.height*0.3:screenSize.height*0.45,
                        width: screenSize.width,
                        child: Image.asset(themeChange.darkTheme?'celeberation_image.webp':'celeberation_image_orange.webp',
                            fit: isScreenSmall?BoxFit.fill:BoxFit.cover),
                      )
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isScreenSmall?16:screenSize.width*0.1, vertical: isScreenSmall?24:screenSize.height*0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\"We often wonder how things would be if we had the technology available to us today, a few decades ago. What if we told you, there are younger minds who dream to have today’s technology in the near future? Perhaps?\” \nAs a country, our education system is still evolving and needs “Rapid innovation, a fair system and impact evaluation”. Today, the power is as much in the hands of Patrons as the government. We have been honoured to have tremendous individuals and corporates coming forward to help Rotary Bangalore South East setup “PRISM” centers in India. Before we go on to say what PRISM is all about, we’d like to mention that, as of today, 12 such centers have been set up and over 60,000 children in the age group of 12-16 have benefitted from these PRISM centers.'
                            ,
                            style: GoogleFonts.poppins(
                                // fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 20.0,
                                letterSpacing: 0.5,
                                // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                              color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],

                            )),
                        SizedBox(height: screenSize.height*0.04,),
                        Text('What is PRISM?'
                            ,
                            style: TextStyle(
                                fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: themeChange.darkTheme?Colors.orange[400]:Colors.blue[400]

                            )),
                        SizedBox(height: 10,),
                        Text('\"Pro-Active Rotary innovative Science and Math center is an essential science and math lab setup in government schools to ensure that the scientific temperament among these children is in par with other schools in the country.\”'
                            ,
                            style: GoogleFonts.poppins(
                                // fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 0.5,
                                // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                              color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],

                            )),
                        SizedBox(height: screenSize.height*0.02,),
                        Text('Imagine having such a lab in schools that lack basic amenities such as toilets and benches? (Yes, we are working on that too). For these children and their teachers, it is a requirement more than it is an act of kindness by a patron.  The PRISM center is an amalgam of science and math kits. These science and math kits come with a working model and a descriptive chart along with a QR code that leads to a concept video based on the language preference. The models are portable so that teachers can carry it into their classrooms, use it as a teaching aid to help root the concept into these young minds in a practical way. Here is how the PRISM lab looks'
                            ,
                            style: GoogleFonts.poppins(
                                // fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 20.0,
                                // fontStyle: FontStyle.italic,
                                letterSpacing: 0.5,
                                // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                              color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],

                            )),
                        SizedBox(height: screenSize.height*0.04,),
                        isScreenSmall?Column(
                          children: [
                            Container(
                                child: Image.asset('prism1.jpg',
                                fit: BoxFit.contain,),
                              height: screenSize.height*0.4,
                            ),
                            Container(
                              child: Image.asset('prism2.jpg',
                                fit: BoxFit.contain,),
                              height: screenSize.height*0.4,
                            ),
                            Container(
                              child: Image.asset('prism3centre.jpg',
                                fit: BoxFit.contain,),
                              height: screenSize.height*0.4,
                            ),
                          ],
                        ):Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Image.asset('prism1.jpg',
                                fit: BoxFit.cover,),
                              height: screenSize.height*0.3,
                            ),
                            Container(
                              child: Image.asset('prism2.jpg',
                                fit: BoxFit.cover,),
                              height: screenSize.height*0.3,
                            ),
                            Container(
                              child: Image.asset('prism3centre.jpg',
                                fit: BoxFit.cover,),
                              height: screenSize.height*0.3,
                            ),
                          ],
                        ),
                        SizedBox(height: screenSize.height*0.04,),
                        Text('Our Path so far..'
                            ,
                            style: TextStyle(
                                fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: themeChange.darkTheme?Colors.orange[400]:Colors.blue

                            )),
                        SizedBox(height: 10,),
                        Text('\"We have been successful in setting up 12 science centers. 12 of them in rural Bangalore and one in Chennai.\”'
                            ,
                            style: GoogleFonts.poppins(
                                // fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                letterSpacing: 0.5,
                                // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                              color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],

                            )),
                        SizedBox(height: screenSize.height*0.02,),
                        Text('These centers are what have been rudiment in helping us benefit 60,000 students. Each science center was donated by a patron or a corporate. The funds were raised either by word of mouth or by organizing fundraising events/concerts in aid of the PRISM centers.'
                            ,
                            style: GoogleFonts.poppins(
                              // fontFamily: 'Bahnschrift',
                              //sans can also be tried
                              fontSize: 20.0,
                              // fontStyle: FontStyle.italic,
                              letterSpacing: 0.5,
                              color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],


                            )),
                        SizedBox(height: screenSize.height*0.04,),
                        Text('Follow up…'
                            ,
                            style: TextStyle(
                                fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: themeChange.darkTheme?Colors.orange[400]:Colors.blue

                            )),
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                  // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                                ),
                                children:[
                                  TextSpan(
                                      text: "As previously mentioned, rapid innovation and a fair system is brought about through setting up of the science centers. But an ",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text:
                                      "impact evaluation",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text: " is paramount to ensure that both the students and the school management are using the PRISM labs to the best of their abilities. To ensure this, we will follow up with ",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text:
                                      "half-yearly exams",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text: " in all the schools for the students based on these models, and award the brightest minds for their excellence. The standards of a central examination will be upheld in all stages.",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                ])
                        ),
                        SizedBox(height: screenSize.height*0.04,),
                        Text('Foot-note'
                            ,
                            style: TextStyle(
                                fontFamily: 'Bahnschrift',
                                //sans can also be tried
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                                color: themeChange.darkTheme?Colors.orange[400]:Colors.blue

                            )),
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                  color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                  // color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                                ),
                                children:[
                                  TextSpan(
                                      text: "There is joy in knowing we can contribute to a cause that also is a need of the hour. We as a club ensue that we cater to ",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text:
                                      '\"Education for all\"',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: themeChange.darkTheme?Colors.blue[400]:Colors.orange,
                                      )
                                  ),
                                  TextSpan(
                                      text: ", in a just way. Setting up one of the PRISM centers costs ",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text:
                                      "INR 3 Lakhs",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme?Colors.blue[400]:Colors.orange,
                                      )
                                  ),
                                  TextSpan(
                                      text: ". There are special provisions for multitudes of ",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text:
                                      "CSR activities",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme?Colors.blue[400]:Colors.orange,
                                      )
                                  ),
                                  TextSpan(
                                      text: " from corporates wanting to fund many PRISM centers and also have their employees engage with the schools directly. We will always be vigilant and to the best of our abilities, serve the society. For the same reasons, we have set a target of ",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                  TextSpan(
                                      text:
                                      "100 PRISM centers by the end of 2021.",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: themeChange.darkTheme?Colors.blue[400]:Colors.orange,
                                      )
                                  ),
                                  TextSpan(
                                      text: "We need any help we can get to ensure the future is equally bright for everyone.",
                                      style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                                      )
                                  ),
                                ])
                        ),
                        SizedBox(height: screenSize.height*0.04,),
                        // Container(
                        //   width: 200,
                        //     color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900],
                        //   height: 2,
                        // )

                      ],
                    ),
                  ),
                  Footer()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
