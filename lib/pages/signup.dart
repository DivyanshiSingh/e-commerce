import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../db/users.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
  String groupValue = "male";
  bool hidePass = true;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'images/cart.png',
                width: 120,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ListTile(
                            title: TextFormField(
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                hintText: "User Name",
                                icon: Icon(Icons.person_outline),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The name field cannot be empty";
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                    //   child: Material(
                    //     borderRadius: BorderRadius.circular(20),
                    //     color: Colors.grey.withOpacity(0.2),
                    //     elevation: 0.0,
                    //     child: Row(
                    //       children: <Widget>[
                    //         Expanded(
                    //           child: ListTile(
                    //             title: Text(
                    //               "male",
                    //               textAlign: TextAlign.end,
                    //               style: TextStyle(color: Colors.black),
                    //             ),
                    //             trailing: Radio(
                    //                 value: "male",
                    //                 groupValue: groupValue,
                    //                 onChanged: (e) => valueChanged(e)),
                    //           ),
                    //         ),
                    //         Expanded(
                    //           child: ListTile(
                    //             title: Text(
                    //               "female",
                    //               textAlign: TextAlign.end,
                    //               style: TextStyle(color: Colors.black),
                    //             ),
                    //             trailing: Radio(
                    //                 value: "female",
                    //                 groupValue: groupValue,
                    //                 onChanged: (e) => valueChanged(e)),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ListTile(
                            title: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.alternate_email),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if (!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ListTile(
                            title: TextFormField(
                              controller: _passwordTextController,
                              obscureText: hidePass,
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters";
                                }
                                return null;
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: ListTile(
                            title: TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: hidePass,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock_outline),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters";
                                } else if (_passwordTextController.text !=
                                    value) {
                                  return "the password don't match";
                                }
                                return null;
                              },
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = false;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () async {
                            validateForm();
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: Text(
                            "Sign up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "I already have an account",
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.deepOrange, fontSize: 16),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Divider(),
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Text("Or Sign up with",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey))),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //  FACEBOOK AND GOOGLE ICONS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Image.asset("images/fb.png", width: 60),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                          child: MaterialButton(
                            onPressed: () {},
                            child: Image.asset("images/ggg.png", width: 60),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.red.shade900),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  Future<void> validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then(
              (authResult) => {
                _userServices.createUser(
                  // user.uid.toString(),
                  {
                    "username": _nameTextController.text,
                    "email": _emailTextController.text,
                    "userId": user.uid,
                    "gender": gender,
                  },
                ),
              },
            )
            .catchError((err) => {print(err.toString())});
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }
}
// .then((authResult) => Firestore.instance
//                   .collection("users")
//                   .document(authResult.user.uid) //returns auth result so you should get user.uid from auth result
//                   .setData({
//                     "uid": authResult.user.uid,
//                     "fname": first_entry.text,
//                     "surname": last_entry.text,
//                     "email": email_entry.text,
//            })
