import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/Register/logIn.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;
  // final _formkey = GlobalKey<FormState>();

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List _isHovering = [false, false, false, false, false, false];
  bool _isLoading = true;
  bool _hasError = false;
  bool _hasNoCertificates = false;
  DocumentSnapshot details = null;
  String password = "";
  String conf_pass = "";
  bool _isDone = false;
  DarkThemeProvider themeChange;
  bool _isDataFetched = false;
  final _formKey = GlobalKey<FormState>();

  void getUserData() async {
    details = await Database("","","","","","").getUserData(themeChange.email);
    _isDataFetched = true;
    // print('object');
    setState(() {
      _isLoading = true;
    });
    if (details != null) {
      setState(() {
        _isLoading = false;
      });
      themeChange.username = details.data()['name'];
      for (int i = 1; i < 5; i++) {
        if (details.data()['event_${i}'] != null && details.data()['event_${i}']
            .toString()
            .length != 0)
        return;
      }
      _hasNoCertificates = true;
    }else{
      // details.data()['events_1'] = null;
      setState(() {
        _isLoading = false;
      });
      _hasNoCertificates = true;
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
    _opacity = _scrollPosition<screenSize.height*0.4? 0.75:1.0;
    themeChange = Provider.of<DarkThemeProvider>(context);
    _isDataFetched?null:getUserData();
    return themeChange.isSignedIn?Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: isScreenSmall?
      AppBar(
        title: Image.asset('title_logo.png',
          fit: BoxFit.contain,
          height: screenSize.height*0.08,),
        backgroundColor: Colors.grey.withOpacity(_opacity),
      )
          :PreferredSize(
        preferredSize: Size(screenSize.width , screenSize.height*0.15),
        child: Padding(
          padding: EdgeInsets.only(top:8.0),
          child: Card(
            elevation: 10,
            color: Colors.grey[900].withOpacity(_opacity),
            child: Container(
              color: Colors.grey[900].withOpacity(_opacity),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical:0, horizontal: screenSize.width*0.1),
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
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline
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
                                //decoration: TextDecoration.underline
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
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    themeChange.isSignedIn?DropdownButton<String>(
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
                      items: <String>['DashBoard','Sign Out' ]
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
            themeChange.isSignedIn? Column(
              children: [
                ListTile(
                  title: Text('DashBoard'),
                  leading: Icon(Icons.person, color: Colors.orange,),
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
              child: _isLoading?Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: screenSize.width,
                      height: isScreenSmall?screenSize.height*0.3:screenSize.height*0.45,
                      child: Image.asset(themeChange.darkTheme?'celeberation_image.png':'celeberation_image_orange.png',
                          fit: isScreenSmall?BoxFit.fill:BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: screenSize.height*0.01),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: SpinKitRing(
                        color: Colors.lightGreenAccent,
                        size: 50.0,
                      ),
                    ),
                  ),
                  Footer()
                ],
              ):Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: screenSize.width,
                      height: isScreenSmall?screenSize.height*0.3:screenSize.height*0.45,
                      child: Image.asset(themeChange.darkTheme?'celeberation_image.webp':'celeberation_image_orange.webp',
                          fit: isScreenSmall?BoxFit.fill:BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: screenSize.height*0.01),
                  Text(
                    "Hello, Rtr. ${themeChange.username}",
                    style: GoogleFonts.monda(
                      fontSize: 50,
                      color: themeChange.darkTheme?Colors.orange:Color(0xff3B3B3B),

                  ),
                  ),
                  // SizedBox(height: 0.5,),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Opacity(opacity: 0.2,
                      child: Image.asset('title_logo.png', fit: BoxFit.contain,width: screenSize.width*0.8,))
                      ,
                      _hasNoCertificates?Text(
                        "No Certificates issued",
                        style: GoogleFonts.montserrat(
                            fontSize: 32,
                            color: themeChange.darkTheme?Colors.grey[400]:Colors.grey[900]
                        ),
                      ):
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Download Your Certificates here",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.blue
                          ),),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenSize.width*0.3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (details.data()['event_1']!=null && details.data()['event_1'].toString().length !=0)?Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('1',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ):SizedBox(height:screenSize.height*0.15,),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('2',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('3',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('4',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ),
                                  ],
                                ),
                              SizedBox(width: screenSize.width*0.002,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (details.data()['event_1']!=null && details.data()['event_1'].toString().length !=0)?Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('Peace Day',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ):SizedBox(height:screenSize.height*0.15,),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('BIT Got Talent',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('Le Panga',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: Text('Blood Donation Camp',
                                        style: TextStyle(
                                            fontSize: 32
                                        ),),
                                    ),
                                  ],
                                ),Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    (details.data()['event_1']!=null && details.data()['event_1'].toString().length !=0)?Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: IconButton(
                                        color: Theme.of(context).buttonColor,
                                        onPressed: () {
                                          launch(details.data()['event_1']);
                                        },
                                        icon : Icon(Icons.cloud_download),
                                        iconSize: 32,
                                        // Text('Peace Day', style: TextStyle(
                                        //   fontSize: 24
                                        // ),),
                                      ),
                                    ):SizedBox(height:screenSize.height*0.15,),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: IconButton(
                                        color: Theme.of(context).buttonColor,
                                        onPressed: () {
                                          launch(details.data()['event_1']);
                                        },
                                        icon : Icon(Icons.cloud_download),
                                        iconSize: 32,
                                        // Text('Peace Day', style: TextStyle(
                                        //   fontSize: 24
                                        // ),),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: IconButton(
                                        color: Theme.of(context).buttonColor,
                                        onPressed: () {
                                          launch(details.data()['event_1']);
                                        },
                                        icon : Icon(Icons.cloud_download),
                                        iconSize: 32,
                                        // Text('Peace Day', style: TextStyle(
                                        //   fontSize: 24
                                        // ),),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top:50),
                                      child: IconButton(
                                        color: Theme.of(context).buttonColor,
                                        onPressed: () {
                                          launch(details.data()['event_1']);
                                        },
                                        icon : Icon(Icons.cloud_download),
                                        iconSize: 32,
                                        // Text('Peace Day', style: TextStyle(
                                        //   fontSize: 24
                                        // ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isScreenSmall?16:screenSize.width*0.1,vertical: isScreenSmall?10:screenSize.height*0.02),
                    child: Container(
                      height: 2,
                      width: double.maxFinite,
                      color: Colors.orange,
                    ),
                  ),
                  _isDone?Text(
                    'Password Changed',
                    style: GoogleFonts.montserrat(
                      color: Colors.orange
                    ),
                  ):Padding(
                    padding: EdgeInsets.symmetric(horizontal: isScreenSmall?16:screenSize.width*0.4, vertical: isScreenSmall?72:screenSize.height*0.02),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                        Text(
                          'Password',
                          style: GoogleFonts.montserrat(
                              fontSize: 22
                          ),
                        ),
                        TextFormField(
                          minLines: 1,
                          validator: (val) => val.length>=10?null:"Enter Strong Password",
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Enter Strong Password',
                          ),
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          onSaved: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          obscureText: true,
                          autovalidate: true,
                        ),
                        SizedBox(
                          height: screenSize.height*0.08 ,
                        ),
                        Text(
                          'Confirm Password',
                          style: GoogleFonts.montserrat(
                              fontSize: 22
                          ),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Confirm Password',
                          ),
                          validator: (val) => val==password?null: "Password not matched",
                          onChanged: (val) {
                            setState(() {
                              conf_pass = val;
                            });
                          },
                          autovalidate: false,
                        ),
                        SizedBox(
                          height: screenSize.height*0.08 ,
                        ),
                          RaisedButton(
                            color: Theme.of(context).buttonColor,
                            child: Text(
                              'Change Password',
                              style: TextStyle(
                                  color: themeChange.darkTheme?Colors.grey[200]:Colors.grey[900],
                                fontSize: 18
                              ),
                            ),
                            elevation: 2,
                            onPressed: () async {
                              if(_formKey.currentState.validate()){
                                dynamic res = await Database("","","","","","").changePassword(password);
                                setState(() {
                                  _isLoading = true;
                                });

                                if(res == 0){
                                  setState(() {
                                    _isLoading=false;
                                    _hasError = true;
                                    _isDone = false;
                                  });
                                }
                                else{
                                  // print(res.toString());
                                  // registeration_id = res.toString().split('/')[1].substring(0,20);
                                  _isDone = true;
                                  _hasError = false;
                                  _isLoading = false;
                                }
                              }
                            },
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
    ):SignIn();
  }
}
