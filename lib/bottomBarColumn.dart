import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  // final String heading;
  final String s1;
  // final String s2;
  final String s3;

  BottomBarColumn({
    // this.heading,
    this.s1,
    // this.s2,
    this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   heading,
          //   style: TextStyle(
          //     color: Colors.blueGrey[300],
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          InkWell(
            onTap: () {Navigator.pushNamed(context, '/contact_us');
            },
            child: Text(
              s1,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
          ),
          // SizedBox(height: 5),
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(context, '/home');
          //   },
          //   child: Text(
          //     s2,
          //     style: TextStyle(
          //       color: Colors.blueGrey[100],
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text(
              s3,
              style: TextStyle(
                color: Colors.blueGrey[100],
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBarRow extends StatelessWidget {
  // final String heading;
  final String s1;
  //final String s2;
  final String s3;

  BottomBarRow({
    // this.heading,
    this.s1,
    //this.s2,
    this.s3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Column(
          children: [
            // Text(
            //   heading,
            //   style: TextStyle(
            //     color: Colors.blueGrey[300],
            //     fontSize: 18,
            //     fontWeight: FontWeight.w500,
            //   ),
            // ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {Navigator.pushNamed(context, '/contact_us');
                    },
                    child: Text(
                      s1,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.pushNamed(context, '/home');
                //     },
                //     child: Text(
                //       s2,
                //       style: TextStyle(
                //         color: Colors.blueGrey[100],
                //         fontSize: 14,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      s3,
                      style: TextStyle(
                        color: Colors.blueGrey[100],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}