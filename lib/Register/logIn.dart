import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/DashBoard/dashboard.dart';
import 'package:rotaract_website/Loading/loading.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;
  final _formkey = GlobalKey<FormState>();

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  List _isHovering = [false, false, false, false, false, false];
  String email_id = "";
  String password = "";
  bool _isLoading = false;
  bool _hasError = false;
  DocumentSnapshot details;
  Future<String> getUserData() async {
    details = await Database("","","","","","").getUserData(email_id);

    for (int i = 1;i<5;i++){
      if (details.data()['event_${i}'] != null && details.data()['event_${i}'].toString().length !=0)
        return details.data()['name'];
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
    // print(screenSize.height*0.45);
    // print(screenSize.width);
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return themeChange.isSignedIn?DashBoard():Scaffold(
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
                  leading: Icon(Icons.person, color: Colors.orange),
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
              child: Column(
                children: [
                  Container(
                    child: SizedBox(
                      width: screenSize.width,
                      height: isScreenSmall?screenSize.height*0.3:screenSize.height*0.45,
                      child: Image.asset(themeChange.darkTheme?'celeberation_image.webp':'celeberation_image_orange.webp',
                          fit: isScreenSmall?BoxFit.fill:BoxFit.cover),
                    ),
                  ),
                  Container(height: screenSize.height*0.19,
                      child: Image.asset('title_logo.png')),
                  SizedBox(height: screenSize.height*0.01,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isScreenSmall?16:screenSize.height*0.8),
                    child: _isLoading?Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: SpinKitRing(
                          color: Colors.lightGreenAccent,
                          size: 50.0,
                        ),
                      ),
                    ):Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _hasError?Text(
                            'Please Enter Correct Credentials',
                            style: GoogleFonts.monda(
                              fontSize: 22,
                              color: Colors.red
                            ),
                          ):SizedBox(height: 0),
                          Text(
                            'Email-Id',
                            style: GoogleFonts.montserrat(
                                fontSize: 22
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Enter your email id',
                            ),
                            onChanged: (val) {
                              setState(() {
                                email_id = val;
                              });
                            },
                            maxLines: 1,
                            autovalidate: true,
                          ),
                          SizedBox(
                            height: screenSize.height*0.08 ,
                          ),
                          Text(
                            'Password',
                            style: GoogleFonts.montserrat(
                                fontSize: 22
                            ),
                          ),
                          TextFormField(
                            minLines: 1,
                            validator: (val) => val.length>=6?null:"Enter Password",
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
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
                            autovalidate: false,
                          ),
                          Center(
                            child: RaisedButton(
                              color: Theme.of(context).buttonColor,
                              child: Text(
                                'Log In',
                                style: TextStyle(
                                    color: themeChange.darkTheme?Colors.grey[200]:Colors.grey[900]
                                ),
                              ),
                              elevation: 2,
                              onPressed: () async {
                                if(_formkey.currentState.validate()){
                                  email_id.replaceAll(' ', '');
                                  dynamic res = await Database("","","","","","").signIn(email_id, password);
                                  setState(() {
                                    _isLoading = true;
                                  });

                                  if(res == null){
                                    setState(() {
                                      _isLoading=false;
                                      _hasError = true;
                                    });
                                  }
                                  else{
                                    setState(() {
                                      themeChange.email = email_id;
                                      themeChange.isSignedIn = true;
                                    });// print('object');
                                  }
                                }
                              },
                            ),
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
    );
  }
}
