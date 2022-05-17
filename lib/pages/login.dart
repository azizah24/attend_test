import 'package:attend_test/database/database_helper_user.dart';
import 'package:attend_test/model/model_user.dart';
import 'package:attend_test/pages/home_page.dart';
import 'package:attend_test/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userid = TextEditingController();
  TextEditingController password = TextEditingController();
  bool kondisipassword = true;
  var res;
  List<ModelUser>? modelUser;
  bool loading = true;

  callData() async {
    modelUser = await DatabaseHelperUser().fetchAllInfo();
    setState(() {
      loading = false;
    });
  }

  loadingAlert(title, status, loading) {
    return showDialog(
        context: context,
        builder: (BuildContext context) => StatefulBuilder(
                builder: (BuildContext context, StateSetter stateSetter) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                contentPadding: EdgeInsets.only(top: 0.0, bottom: 20),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Divider(
                        color: Colors.grey,
                        height: 1.0,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(19.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            status != null
                                ? status == true
                                    ? Icon(
                                        Icons.check,
                                        size: 30,
                                      )
                                    : Icon(
                                        Icons.clear,
                                        size: 30,
                                      )
                                : Container(),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '$title',
                              style: blacklight400,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            loading == true
                                ? CircularProgressIndicator(
                                    color: yellow200,
                                  )
                                : Container(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          loading
              ? Container()
              : Center(
                  child: Image.network(
                    'https://greatdayhr.com/wp-content/uploads/2021/05/Attendance-Terintegrasi-dengan-mesin-fingerprint_05.png',
                    width: 255,
                  ),
                ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loading ? Container() : Text('${modelUser?[0].nama}'),
                Text(
                  'Silahkan masuk menggunakan akunmu',
                  style: blackMed,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Masuk dengan akun karyawan',
                  style: blacklight400,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'ID',
                  style: blackMed,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(1, 1)),
                      ]),
                  child: TextFormField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Masukkan ID',
                      hintStyle: blacklight400,
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none,
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8),
                        borderSide: BorderSide(color: yellow200),
                      ),
                      enabledBorder: InputBorder.none,
                      errorBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffE64646)),
                      ),
                      disabledBorder: InputBorder.none,
                    ),
                    validator: (val) {
                      if (val == null) return 'ID tidak boleh kosong';
                    },
                    controller: userid,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Kata Sandi',
                  style: blackMed,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 4,
                            spreadRadius: 0,
                            offset: Offset(1, 1)),
                      ]),
                  child: TextFormField(
                    key: Key('pass'),
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Kata Sandi',
                      hintStyle: blacklight400,
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none,
                      focusedBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8),
                        borderSide: BorderSide(color: yellow200),
                      ),
                      enabledBorder: InputBorder.none,
                      errorBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8),
                        borderSide: BorderSide(color: Color(0xffE64646)),
                      ),
                      disabledBorder: InputBorder.none,
                      suffixIcon: IconButton(
                          icon: Icon(
                            kondisipassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xffffcc80),
                          ),
                          onPressed: () {
                            setState(() {
                              kondisipassword = !kondisipassword;
                            });
                          }),
                    ),
                    obscureText: kondisipassword,
                    controller: password,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    key: Key('button'),
                    onTap: () async {
                      if (userid.text == modelUser?[0].id &&
                          password.text == modelUser?[0].password) {
                        setState(() {
                            Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) => HomePage(dataUser: modelUser?[0])));

                        });
                      } else {
                        setState(() {
                          loadingAlert(
                              'ID atau Kata Sandi tidak sama', false, false);
                        });
                      }
                    },
                    child: Container(
                      key: Key('but'),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(0xffffcc80),
                                Color(0xffff9c42),
                              ]),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 4,
                                spreadRadius: 0,
                                offset: Offset(0, 1)),
                            BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                blurRadius: 1,
                                spreadRadius: 0,
                                offset: Offset(0, 1)),
                          ]),
                      child: Center(
                        child: Text('Log In', style: whiteSemi),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
