import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rotaract_website/event.dart';
import 'package:rotaract_website/footer.dart';
import 'package:rotaract_website/services/Database.dart';
import 'package:rotaract_website/services/sharedPref.dart';

class Event extends StatefulWidget {

  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<Event> {
  ScrollController _scrollController;
  double _opacity = 0;
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }
  List _isHovering = [false, false, false, false, false, false, false];

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {_scrollListener();
    }
    );
    super.initState();
  }
  List<Event_detail> events = [
    Event_detail("spooktecular.jpeg", "Spooktecular", DateTime(2020,09,12), "Professional Service", "We the Rotaract Club of Bangalore B.I.T. organised \"The SPOOKTACULAR- Unleash the creator in you\" and the theme for this event was Halloween. This was a talent hunt event during this pandemic. The basis of judgement being creativity alone, this unbounded the participant's creativity to innovate. The participants were requested to submit their entries in the drive link. The event saw a great inflow of participants due to its unique approach. The event was judged by Sameera, who is an Instagram influencer. The winner for this event was Shantanu Kumar and runner-up position was bagged by Sweta Jayaswal. This was a fun-filled venture and overwhelming experience for all of us."),
    Event_detail("codigo.jpeg", "CODIGO", DateTime(2020,09,12), "Professional Service", "It's ton times difficult to outstand than to stand. Cheers to the winner Sameer Rastogi and the runner-up Shravya Suresh for showing an outstanding aptitude in the online coding event CODIGO conducted on 30 October 2020 from 11 a.m. to 4 p.m. Rotaract Club of Bangalore B.I.T. heartily congratulates the champs. Keep coding. Keep growing!"),
    Event_detail("peace_day.jpeg", "Peace Day", DateTime(2020,09,12),"International Service", "Peace is known as freedom from disturbance. Peace is when people can resolve their needs without aggression and work together to improve the quality of life. This reminds us of someone describing Mother Teresa where they say that if she was invited to an anti-war campaign, she would not attend, but if she was invited to a peace campaign, she would definitely attend. She believed - \"We do not need guns and arms to bring peace, we need love and compassion\". WORLD PEACE DAY is envisioned to become a moment of global unity and it is up to each and every one of us to make this a reality. We at Rotaract Club of Bangalore BIT bring you the \"POWER TO THE PEACEFUL\". The moto of this event is to create awareness among people and make a difference in the society. The team of Rotaract Club of Bangalore BIT takes this opportunity to wish you all a very Happy World Peace Day.\nWe take a bow acknowledging the ones who are involved in making peace around the world."),
    // Event_detail("bgt.jpeg", "BGT", DateTime(2020,9,12), "Community Service", "Rotaract Club of Bangalore B.I.T. organized BIT's Got Talent on 19th October 2019. All the students participated enthusiastically and showed some amazing skills. We were delighted to witness plethora of talents and we wholeheartedly appreciate everyone who participated in the event. We were immensely honoured to have Rtn. Rahul Raghavan, Rtr. Pooja Girish and Dhanush as our judges and we congratulate our winner PRATUYSH SINHA, 1st runner up OVAIS KAREEM and BHAVESH PRASAD and 2nd runner up SAHANA."),
    Event_detail("le_panga_event.jpeg", "Le Panga", DateTime(2020,9,12), "Community Service", "Rotaract Club Of Bangalore B.I.T. conducted it's flagship event, \"Le-Panga\", the Kabaddi tournament on 8th November, 2019. Sports enthusiasts gathered together in the event to witness the opening ceremony of tournament. The sponsors for the event were Rotary Bangalore South East, MicroPort ,Rajguru V.M., Managing Director, JN Projects Pvt. ltd and Rtn. K.C. Jayaram- Rotary Bangalore High grounds. The chief guests present for this prestigious event were; Jeeva Kumar, an ardent representative of India in the sports of Kabaddi. he was a member of the Kabaddi team that won a gold medal in 2010 Asian games. He is a part of the team Bengal Warriors in Pro Kabaddi League.The guest of honours were, Rtn. Dr. Ashwath M.U, Principal of B.I.T, Rtn. Shankar Narayan, President of Rotary Bangalore South East and Rajguru V.M., a successful business man and managing director of JN Project Pvt. Ltd. The guest of honours , the Principal and the faculty members welcomed the guests Altogether, the tournament was filled with lots of fun and enthusiasm."),
    Event_detail("abacus.jpeg", "Abacus", DateTime(2020,9,12), "Community Service", "Rotaract Club of Bangalore B.I.T. in association with our parent Rotary, Rotary Bangalore South East and Anusiri Academy organized the Annual Abacus Competition on 12th January at Bangalore Institute of Technology. The event commenced with zeal and around 500 students from various schools across Bangalore participated in the event. The team of RCBIT along with its dedicated volunteers ensured smooth flow of the event and made it a success. Other than Abacus, events such as drawing, chess, rubik\'s cube, painting and calligraphy also took place. Altogether, the team had a great time conducting the event and interacting with the students."),
    Event_detail("pratibha.JPG", "Pratibha", DateTime(2020,9,12), "Community Service", "Rotaract District Council 3190 in association with Rotaract Club of Bangalore B.I.T. and Rotaract Club of Presidency College conducted an event Pratibha-2k19 on 26th of October at Kuvempu Kalakshetra. \"Pratibha\" is a cultural fest that provided a great platform to government school children to showcase their talents. It comprised of several events like singing, dance, drama, pot painting, face-painting, mehendi, rangoli, mono-acting etc. The school children were trained in their respective genre. The event ended with prize distribution ceremony for the children. All together, the event was filled with plethora of cultural performances by Government school children and loads of fun activities."),
    Event_detail("bgt.jpeg", "BGT", DateTime(2020,9,12), "Professional Service", "Rotaract Club of Bangalore B.I.T. organized BIT's Got Talent on 19th October 2019. All the students participated enthusiastically and showed some amazing skills. We were delighted to witness plethora of talents and we wholeheartedly appreciate everyone who participated in the event. We were immensely honoured to have Rtn. Rahul Raghavan, Rtr. Pooja Girish and Dhanush as our judges and we congratulate our winner PRATUYSH SINHA, 1st runner up OVAIS KAREEM and BHAVESH PRASAD and 2nd runner up SAHANA."),
  ];
  bool isScreenSmall = false;
  var screenSize;
  List<Column> getEventDetails() {
    return events.map((e) => Column(
     children: [
       Column(
         //column to contain info of event
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             child: Image.asset(
                 e.pic
             ),
             height: isScreenSmall?screenSize.height*0.2:screenSize.height*0.8,
             width: isScreenSmall?screenSize.width*0.95:screenSize.width*0.7,
           ),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             //column to contain text information of event
             children: [
               Text(
                 e.name,
                 textAlign: TextAlign.start,
                 style: GoogleFonts.montserrat(
                     fontSize: 40,
                     fontWeight: FontWeight.bold
                 ),
               ),
               Text(
                 //category
                 e.category,
                 style: GoogleFonts.robotoCondensed(
                     fontSize: 25,
                     color: Colors.orange
                 ),
               ),
               // Text(
               //    "${e.dateTime.day}-${e.dateTime.month}-${e.dateTime.year}",
               //   style: GoogleFonts.montserrat(
               //       fontSize: 20,
               //       color: Colors.pink,
               //       fontWeight: FontWeight.bold
               //   ),
               // ),
               // SizedBox(
               //   height: screenSize.height*0.05,
               // ),
               Center(
                 child: Text(
                   e.description,
                   style: GoogleFonts.poppins(
                       fontSize: 26,
                       color: Colors.grey[700]
                   ),
                 ),
               )
             ],
           )
         ],
       ),
       SizedBox(height: isScreenSmall?screenSize.height*0.07:screenSize.height*0.1),
     ],
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    isScreenSmall = MediaQuery.of(context).size.width < 640.0;
    screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition<screenSize.height*0.4? 0.75:1;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: isScreenSmall?AppBar(
        title: Image.asset('title_logo.png',
          fit: BoxFit.contain,
          height: screenSize.height*0.08,),
        backgroundColor: Colors.grey.withOpacity(_opacity),
      ):PreferredSize(
        preferredSize: Size(screenSize.width, screenSize.height*0.15),
        child: Padding(
          padding: EdgeInsets.only(top:8.0),
          child: Card(
            elevation: 10,
            color: Colors.grey[900].withOpacity(_opacity),
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
                                  decoration: TextDecoration.underline,
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
                                  fontWeight: FontWeight.w600,
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
      ),drawer: isScreenSmall?Drawer(
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
            leading: Icon(Icons.calendar_today, color: Colors.orange),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: isScreenSmall?screenSize.height*0.01:screenSize.height*0.1, horizontal: isScreenSmall?16:screenSize.width*0.2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: getEventDetails(),
                        ),
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
      floatingActionButton: isScreenSmall?FloatingActionButton(
        backgroundColor: themeChange.darkTheme?Colors.grey:Colors.black12,
        onPressed: () {
          themeChange.darkTheme = !themeChange.darkTheme;
        },
        child: Icon(Icons.brightness_medium,
            color: themeChange.darkTheme?Colors.white:Colors.grey[800]),
      ):null,
    );
  }
}
