import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: TextTheme(
              bodyText2: TextStyle(color: Colors.white),
              bodyText1: TextStyle(color: Colors.white))),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text("Weather Forecast"),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _buildBody() => SingleChildScrollView(
      child: Container(
        color: Colors.red,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              children: [
                _search(),
                _cityDetail(),
                _temperatureDetail(),
                _extraWeatherDetail(),
                _bottomDetail(),
              ],
            ),
          ),
        ),
      ),
    );

Widget _search() => TextField(
      style: TextStyle(
          fontSize: 16,
          color: Colors.black,
          textBaseline: TextBaseline.alphabetic),
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          hintText: "Enter City Name",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 32.0,
              ),
              borderRadius: BorderRadius.circular(25.0))),
    );

Widget _cityDetail() => Padding(
      padding: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Murmansk Oblast, RU",
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 10.0),
          Text(
            "Friday, Mar 20, 2020",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );

Widget _temperatureDetail() => Padding(
      padding: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.wb_sunny,
            color: Colors.white,
            size: 75,
          ),
          SizedBox(width: 16.0),
          Column(
            children: [
              Text(
                "14 °F",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 50),
              ),
              Text("LIGHT SNOW",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18)),
            ],
          )
        ],
      ),
    );

Widget _extraWeatherDetail() => Padding(
      padding: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Text(
                "5",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              Text(
                "km/hr",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Text(
                "3",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              Text(
                "%",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Text(
                "20",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              Text(
                "%",
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );

Widget _bottomDetail() => Padding(
      padding: EdgeInsets.only(top: 60, bottom: 100),
      child: Column(
        children: [
          Text(
            "7-DAY WEATHER FORECAST",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 16),
          Container(
            height: 110,
            child: BodyListView(),
          )
        ],
      ),
    );

Widget _myListView() {
  final days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  final icons = [
    Icons.ac_unit,
    Icons.wb_sunny,
    Icons.wb_sunny,
    Icons.ac_unit,
    Icons.ac_unit,
    Icons.wb_sunny,
    Icons.wb_sunny
  ];

  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 150,
      itemCount: days.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(4),
          child: Container(
            color: Color(0xFFE47373),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${days[index]}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${Random().nextInt(20)} °F",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300),
                    ),
                    Icon(
                      icons[index],
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
