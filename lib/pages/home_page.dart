import 'dart:async';

import 'package:attend_test/pages/started_page.dart';
import 'package:attend_test/theme.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  dynamic dataUser;

  HomePage({this.dataUser});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String timeString = '';
  String date = '';
  Timer? timer;
  String startTime = '--:--', endTime = '--:--';
  int? selected;
  String condition = '';
  String urlImage = '';
  String id_condition = '';
  Position? _currentPosition;
  String currentLoct = '';
  var day,
      hour,
      min,
      sec,
      hours,
      mins,
      secs,
      parseTime,
      parseTimeEnd,
      formatStartMili,
      formatEndMili,
      formatTodayMili,
      startFormat,
      endFormat,
      todayFormat,
      today,
      startTimeInt,
      endTimeInt,
      todayTimeInt,
      count;

  void getTime() {
    final String formatDate =
        DateFormat('E, d MMMM yyyy').format(DateTime.now());

    final String formatTime = DateFormat().add_Hms().format(DateTime.now());
    if (startTime != '') {
      if (startTime != '--:--') {
        parseTime = DateTime.parse('2022-05-12 $startTime');
        startFormat = DateFormat.Hm().format(parseTime);
        formatStartMili = parseTime.millisecondsSinceEpoch / 1000;
        startTimeInt = formatStartMili.toInt();
        if (endTime == '--:--') {
          today = DateTime.parse('2022-05-12 $formatTime');
          todayFormat = DateFormat.Hm().format(today);
          formatTodayMili = today.millisecondsSinceEpoch / 1000;
          todayTimeInt = formatTodayMili.toInt();
          count = todayTimeInt - startTimeInt;
          day = ((count / 60 / 60) / 24).toInt();
          hour = ((count / 60 / 60) - (day * 24)).toInt();

          min = (count % 3600 / 60).toInt();
          sec = (count % 60).round();
          if (hour < 9) {
            hours = '0' + hour.toString();
          } else {
            hours = hour.toString();
          }
          if (min < 9) {
            mins = '0' + min.toString();
          } else {
            mins = min.toString();
          }
          if (sec < 9) {
            secs = '0' + sec.toString();
          } else {
            secs = sec.toString();
          }
        } else {
          parseTimeEnd = DateTime.parse('2022-05-12 $endTime');
          endFormat = DateFormat.Hm().format(parseTimeEnd);
          formatEndMili = parseTimeEnd.millisecondsSinceEpoch / 1000;
          endTimeInt = formatEndMili.toInt();
          count = endTimeInt - startTimeInt;
          day = ((count / 60 / 60) / 24).toInt();

          hour = 0 + ((count / 60 / 60) - (day * 24)).toInt();
          min = 0 + (count % 3600 / 60).toInt();
          sec = 0 + (count % 60).round();
          if (hour < 9) {
            hours = '0' + hour.toString();
          } else {
            hours = hour.toString();
          }
          if (min < 9) {
            mins = '0' + min.toString();
          } else {
            mins = min.toString();
          }
          if (sec < 9) {
            secs = '0' + sec.toString();
          } else {
            secs = sec.toString();
          }
        }
      }
    }

    setState(() {
      date = formatDate;
      timeString = formatTime;
    });
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(_currentPosition);
        currentLoct =
            '${_currentPosition?.longitude},${_currentPosition?.latitude}';
        print(_currentPosition?.longitude);
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Hadirmu',
          style: whiteSemi.copyWith(fontSize: 16),
        ),
        backgroundColor: secondary500,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://i2.wp.com/analisaaceh.com/wp-content/uploads/2021/12/Profil-Whatsapp-Aestetik-8.jpg.webp'),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, ${widget.dataUser.nama}',
                                  style: blackReg500,
                                ),
                                Text(
                                  '${widget.dataUser.jabatan}',
                                  style: blacklight400,
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => StartedPaage()));
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: primary400,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: neutral200,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('$date'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('$timeString')
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text('$startTime'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'Mulai',
                                    style: blacklight400,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('$endTime'),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text('Selesai', style: blacklight400)
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Column(children: [
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: neutral300,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Durasi Kerja',
                                  style: blacklight400.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Center(
                              child: Text(
                                hours == null
                                    ? '00:00:00'
                                    : '$hours:$mins:$secs',
                                style: blackMed.copyWith(
                                    color: neutral500, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              startTime == '--:--'
                  ? InkWell(
                      onTap: () async {
                        try {
                          setState(() async {});
                        } catch (e) {}
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [yellow200, Color(0xff5cffb1)]),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff2e5dd6).withOpacity(0.25),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 1))
                            ]),
                        padding: EdgeInsets.all(14),
                        child: Center(
                            child: Text(
                          'Mulai Kerja',
                          style: whiteSemi.copyWith(fontSize: 14),
                        )),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              startTime != '--:--' && endTime == '--:--'
                  ? InkWell(
                      onTap: () async {
                        try {} catch (e) {}
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: red200,
                            boxShadow: [
                              BoxShadow(
                                  color: yellow200.withOpacity(0.25),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 1))
                            ]),
                        padding: EdgeInsets.all(14),
                        child: Center(
                            child: Text(
                          'Selesai Kerja',
                          style: whiteSemi.copyWith(fontSize: 14),
                        )),
                      ),
                    )
                  : Container(),
              endTime != '--:--'
                  ? InkWell(
                      onTap: () async {
                        try {
                          setState(() async {});
                        } catch (e) {}
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: primary400,
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xff2e5dd6).withOpacity(0.25),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                  offset: Offset(0, 1))
                            ]),
                        padding: EdgeInsets.all(14),
                        child: Center(
                            child: Text(
                          'Ubah Jam Akhir Kerja',
                          style: whiteSemi.copyWith(fontSize: 14),
                        )),
                      ),
                    )
                  : Container()
            ],
          )
        ],
      ),
    );
  }
}
