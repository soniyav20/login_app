import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/auth/auth.dart';
import 'package:login_app/auth/database.dart';
import 'package:login_app/loggedin.dart';
import 'package:login_app/mailforotp.dart';
import 'package:login_app/registernow.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  AuthService authService = new AuthService();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController passcont = new TextEditingController();
  TextEditingController mailcont = new TextEditingController();
  TextEditingController namecont = new TextEditingController();

  singUp() async {
    await authService
        .signUpWithEmailAndPassword(mailcont.text, passcont.text)
        .then((val) {
      Map userMap = {
        'name': namecont.text,
        'email': mailcont.text,
      };
      databaseMethods.Upload(userMap);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Logged()));
    });
  }

  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
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
                    'Enter a valid e-mail id',
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
                    'Username must be more than 4 characters and less than 10 characters',
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
                    'Password must be 8 characters',
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

  var enteredmail = '';
  var enteredpass = '';
  var newtext;
  var newpass;
  var enteredname = '';
  var newname;

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
                  'MyChat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 50.0,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: namecont,
                onChanged: (newname) {
                  enteredname = newname;
                },
                obscureText: p,
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
                onChanged: (newtext) {
                  enteredmail = newtext;
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
                onChanged: (newpass) {
                  enteredpass = newpass;
                },
                obscureText: p,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (p == false) {
                            p = true;
                          } else {
                            p = false;
                          }
                          if (using == openeye) {
                            using = closeeye;
                          } else {
                            using = openeye;
                          }
                        });
                      },
                      icon: Icon(using)),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Mail()));
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blue,
                    ),
                  )),
              SizedBox(
                height: 10.0,
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
                        .hasMatch(enteredmail);
                    if (enteredmail == '' ||
                        enteredpass == '' ||
                        enteredname == '') {
                      AlertDialog(context);
                    } else {
                      if (enteredname.length < 10 && enteredname.length > 4) {
                        if (enteredpass.length == 8) {
                          if (emailValid == true) {
                            singUp();
                          } else {
                            createAlertDialogue(context);
                          }
                        } else {
                          SimpleDialog(context);
                        }
                      } else {
                        AboutDialog(context);
                      }
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.5,
              ),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterNow()));
                        },
                        child: Text(
                          'Register now',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blue,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Text(
                'Developer : Soniya.V',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
