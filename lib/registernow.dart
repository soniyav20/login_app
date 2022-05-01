import 'package:flutter/material.dart';
import 'package:login_app/auth/auth.dart';
import 'package:login_app/auth/database.dart';
import 'package:login_app/loggedin.dart';
import 'package:login_app/main.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  _RegisterNowState createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  bool isLoading = false;
  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController passcont = new TextEditingController();
  TextEditingController mailcont = new TextEditingController();
  TextEditingController namecont = new TextEditingController();

  singUp() async {
    Map userMap = {
      'name': namecont.text,
      'email': mailcont.text,
    };
    await authService
        .signUpWithEmailAndPassword(mailcont.text, passcont.text)
        .then((val) {
      databaseMethods.Upload(userMap);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Logged()));
    });
  }

  bool p = true;
  bool p1 = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var using1 = Icons.remove_red_eye;
  createAlertDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              elevation: 8.0,
              backgroundColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Error:\nUsername must be more than 4 and less than 10 characters.\nEnter a valid e-mail id and username.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.blue,
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ));
        });
  }

  AboutDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              elevation: 8.0,
              backgroundColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Error:\nPassword must be 8 characters long.\nThe password entered for registration and the confirmation password should be same.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.blue,
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ));
        });
  }

  SimpleDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              elevation: 8.0,
              backgroundColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'You are succesfully Registered',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                          (Route<dynamic> route) => false);
                    },
                    color: Colors.blue,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ));
        });
  }

  AlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              elevation: 8.0,
              backgroundColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Fill all the fields properly',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: Colors.blue,
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ));
        });
  }

  var enteredmail1 = '';
  var enteredname = '';
  var enteredpass1 = '';
  var newtext1;
  var newpass1;
  var newname;
  var enteredpass2 = '';
  var newpass2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Text(
                    'New Registration',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: namecont,
                  onChanged: (newname) {
                    enteredname = newname;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your Username',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.account_circle),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: mailcont,
                  onChanged: (newtext1) {
                    enteredmail1 = newtext1;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your e-mail address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  controller: passcont,
                  onChanged: (newpass1) {
                    enteredpass1 = newpass1;
                  },
                  obscureText: p,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (using == openeye) {
                            using = closeeye;
                          } else {
                            using = openeye;
                          }
                          setState(() {
                            if (p == false) {
                              p = true;
                            } else {
                              p = false;
                            }
                          });
                        },
                        icon: Icon(using)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (newpass2) {
                    enteredpass2 = newpass2;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: p1,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (using1 == openeye) {
                            using1 = closeeye;
                          } else {
                            using1 = openeye;
                          }
                          setState(() {
                            if (p1 == false) {
                              p1 = true;
                            } else {
                              p1 = false;
                            }
                          });
                        },
                        icon: Icon(using1)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: double.infinity,
                  height: 54.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(enteredmail1);
                      if (enteredmail1 == '' ||
                          enteredpass1 == '' ||
                          enteredpass2 == '') {
                        AlertDialog(context);
                      } else {
                        if (emailValid == true &&
                            4 < enteredname.length &&
                            enteredname.length < 10) {
                          if (enteredpass2 == enteredpass1 &&
                              enteredpass1.length == 8) {
                            SimpleDialog(context);
                          } else {
                            AboutDialog(context);
                          }
                        } else {
                          createAlertDialogue(context);
                        }
                      }
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
