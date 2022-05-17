import 'package:attend_test/database/database_helper_user.dart';
import 'package:attend_test/model/model_user.dart';
import 'package:attend_test/pages/login.dart';
import 'package:attend_test/theme.dart';
import 'package:flutter/material.dart';

class StartedPaage extends StatefulWidget {
  const StartedPaage({Key? key}) : super(key: key);

  @override
  State<StartedPaage> createState() => _StartedPaageState();
}

class _StartedPaageState extends State<StartedPaage> {
  createUser() async {
    await DatabaseHelperUser().addDataUser(ModelUser(
        nama: 'Azizah',
        id: 'azizah',
        password: '123456',
        jabatan: 'Developer'));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.network(
              'https://greatdayhr.com/wp-content/uploads/2021/05/Attendance-Terintegrasi-dengan-mesin-fingerprint_05.png',
              height: 315,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            'Hadirmu',
            style: blackBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Tingkatkan kinerjamu dengan\npencatatan kehadiran dengan mudah',
            textAlign: TextAlign.center,
            style: blacklight400,
          ),
          SizedBox(
            height: 32,
          ),
          InkWell(
            onTap: () async {
              var responses;

              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: EdgeInsets.only(top: 12, bottom: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff4579ff).withOpacity(0.25),
                        blurRadius: 12,
                        spreadRadius: 0,
                        offset: Offset(0, 4))
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Color(0xffffcc80), Color(0xff5cffb1)])),
              child: Center(
                child: Text('Get Started', style: whiteSemi),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
