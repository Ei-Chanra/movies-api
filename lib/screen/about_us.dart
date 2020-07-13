import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moviesapi/main.dart';
import 'package:moviesapi/pages/home_page.dart';
import 'package:moviesapi/utilities/constant.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),

    );
  }
}

_buildAppbar(BuildContext context){
  return AppBar(
    leading: Builder(builder: (BuildContext context) {
      return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      );
    }),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Stardust',
          style: kAppBarTitle1Style,
        ),
        SizedBox(width: 2),
        Text(
          'Movie',
          style: kAppBarTitle2Style,
        )
      ],
    ),
    titleSpacing: 3,
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.share),
        padding: EdgeInsets.only(right: 2),
        onPressed: () {
          modal.shareCouponModal(context);
        },
      ),
    ],
  );
}

_buildBody(BuildContext context){
 return Container(
   width: MediaQuery.of(context).size.width,
   height: MediaQuery.of(context).size.height,
   color: Colors.green,
   child: Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: <Widget>[
       Container(
         width: 300,
         height: 200,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
           color: Colors.red,
         ),
       ),
     ],
   ),
 );
}
