import 'dart:io';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
class Home extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    bool isWidthSmall = MediaQuery.of(context).size.width < 640.0;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: isWidthSmall?PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SafeArea(
          child: AppBar(
            automaticallyImplyLeading: false,
            title: PreferredSize(
              preferredSize: Size.fromHeight(300.0),
              child: Image.asset('title_logo.png',
              height: 250.0,
              scale: 0.001),
            ),
            backgroundColor: Colors.black,
            actions: !isWidthSmall?[
              FlatButton(
                onPressed: () {},
                child: Text('Home',
                style: TextStyle(
                  color: Colors.white
                )),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Rotary',
                    style: TextStyle(
                        color: Colors.white
                    )),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Events',
                    style: TextStyle(
                        color: Colors.white
                    )),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Board',
                    style: TextStyle(
                        color: Colors.white
                    )),
              ),
              FlatButton(
                onPressed: () {},
                child: Text('Contact Us',
                    style: TextStyle(
                        color: Colors.white
                    )),
              ),
              SizedBox(width: 200.0)
            ]:null,
          ),
        ),
      ):null,
      drawer: isWidthSmall?Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Image.asset('title_logo.png',
                      height: 120.0,
                      width: 250.0,
                      scale: 0.1),
                  Text('Rotaract Club of BIT'),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Rotary'),
              leading: Icon(Icons.settings),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Events'),
              leading: Icon(Icons.calendar_today),
              onTap: () {},
            ),
            ListTile(
              title: Text('Board'),
              leading: Icon(Icons.people),
              onTap: () {},
            ),
            ListTile(
              title: Text('Contact us'),
              leading: Icon(Icons.contact_mail),
              onTap: () {},
            ),
          ],
        ),
      ):null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(height: isWidthSmall?height/4.0:height/2.0,
                    autoPlay: true),
                    items: [1,2,3,4,5].map((e) => Builder(
                      builder: (BuildContext context) => Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.symmetric(horizontal: 205.0),
                        decoration: BoxDecoration(
                          color: Colors.amber
                        ),
                        child: Text('text $e',
                        style: TextStyle(fontSize: 16.0)),
                      ),
                    )).toList(),
                  ),
                  SizedBox(height: 5.0),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Row(
                          //Row to contain president's image and principal's image
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              //Column to contain information about president
                              children: [
                                Image.network('http://www.tiig-eg.com/uploads/9955d-person.jpg',
                                    height: 400.0),
                                SizedBox(height: 10.0),
                                Text('Generating random paragraphs can be an excellent way for writers to \n'+
                                    'get their creative flow going at the beginning of the day. The writer has\n'+
                                    ' no idea what topic the random paragraph will be about when it appears. \n'+
                                    'This forces the writer to use creativity to complete one of three common\n'
                                        ' writing challenges. The writer can use the paragraph as the first one \n'
                                    ,
                                    style: TextStyle(
                                        fontSize: 14.0
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Image.network('http://www.tiig-eg.com/uploads/9955d-person.jpg',
                                    height: 400.0),
                                SizedBox(height: 10.0),
                                Text('Generating random paragraphs can be an excellent way for writers to \n'+
                                    'get their creative flow going at the beginning of the day. The writer has\n'+
                                    ' no idea what topic the random paragraph will be about when it appears. \n'+
                                    'This forces the writer to use creativity to complete one of three common\n'
                                        ' writing challenges. The writer can use the paragraph as the first one \n'
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Text('About the Club',
                          style: TextStyle(
                              fontSize: 42.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.pink
                          )),
                      SizedBox(height: 20.0),
                      Text('Rotaract RVCE is one of the most oldest and dynamic clubs in Rvce.\n'
                          'We are a group of enthusiastic individuals who strive ahead for bringing about\na positive change in our society. We work under our parent Rotary Club-3190 Our Mottos are as follows:',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600]
                          )),
                      SizedBox(height: 40.0),
                      Column(
                        //column about the club points
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('1.' + ' Generating random paragraphs can be an excellent way for writers to \n'+
                              'get their creative flow going at the beginning of the day. The writer has\n',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]
                              )),
                          SizedBox(height: 12.0),
                          Text('2. ' + 'Generating random paragraphs can be an excellent way for writers to \n'+
                              'get their creative flow going at the beginning of the day. The writer has\n',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]
                              )),
                          SizedBox(height: 12.0),
                          Text('1. ' + 'Generating random paragraphs can be an excellent way for writers to \n'+
                              'get their creative flow going at the beginning of the day. The writer has\n',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]
                              )),
                        ],
                      ),
                      SizedBox(height:200.0),
                      Text('Events RoadMap',
                          style: TextStyle(
                              fontSize: 42.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.pink
                          )),
                      SizedBox(height: 40.0),
                      Column(
                        //Column for roadmap
                        children: [
                          InkWell(
                            radius: 120.0,
                            splashColor: Colors.pink,
                            child: CircleAvatar(
                              radius: 120.0,
                              backgroundColor: Colors.lightBlueAccent,
                              child: Text('Event 1',
                              style: TextStyle(
                                fontSize: 44.0
                              ),),
                            ),
                            onTap: () {},
                            hoverColor: Colors.transparent,
                          ),
                          Icon(Icons.arrow_downward,size: 200.0),
                          InkWell(
                            radius: 120.0,
                            splashColor: Colors.pink,
                            child: CircleAvatar(
                              radius: 120.0,
                              backgroundColor: Colors.lightBlueAccent,
                              child: Text('Event 2',
                                  style: TextStyle(
                                      fontSize: 44.0
                                  )),
                            ),
                            onTap: () {},
                            hoverColor: Colors.transparent,
                          ),
                          Icon(Icons.arrow_downward,size: 200.0),
                          InkWell(
                            radius: 120.0,
                            splashColor: Colors.pink,
                            child: CircleAvatar(
                              radius: 120.0,
                              backgroundColor: Colors.lightBlueAccent,
                              child: Text('Event 3',
                                  style: TextStyle(
                                      fontSize: 44.0
                                  )),
                            ),
                            onTap: () {},
                            hoverColor: Colors.transparent,
                          ),
                          Icon(Icons.arrow_downward,size: 200.0),
                          InkWell(
                            radius: 120.0,
                            splashColor: Colors.pink,
                            child: CircleAvatar(
                              radius: 120.0,
                              backgroundColor: Colors.lightBlueAccent,
                              child: Text('Event 4',
                                  style: TextStyle(
                                      fontSize: 44.0
                                  )),
                            ),
                            onTap: () {},
                            hoverColor: Colors.transparent,
                          ),
                          Icon(Icons.arrow_downward,size: 200.0),
                          InkWell(
                            radius: 120.0,
                            splashColor: Colors.pink,
                            child: CircleAvatar(
                              radius: 120.0,
                              backgroundColor: Colors.lightBlueAccent,
                              child: Text('Event 5',
                                  style: TextStyle(
                                      fontSize: 44.0
                                  )
                              ),
                            ),
                            onTap: () {},
                            hoverColor: Colors.transparent,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
