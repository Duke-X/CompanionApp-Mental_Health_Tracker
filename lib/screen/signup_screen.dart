// import 'package:flutter/material.dart';
// import 'package:demo_app/screen/signin_screen.dart';
// import 'package:demo_app/theme/theme.dart';
// import 'package:demo_app/widgets/custom_scaffold.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formSignupKey = GlobalKey<FormState>();
//   final _auth = FirebaseAuth.instance;
//   final _firestore = FirebaseFirestore.instance;
//   final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();
//   bool agreePersonalData = true;
//   String fullName = '';
//   String email = '';
//   String password = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       child: Column(
//         children: [
//           const Expanded(
//             flex: 1,
//             child: SizedBox(
//               height: 10,
//             ),
//           ),
//           Expanded(
//             flex: 7,
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40.0),
//                   topRight: Radius.circular(40.0),
//                 ),
//               ),
//               child: SingleChildScrollView(
//                 child: Form(
//                   key: _formSignupKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Get Started',
//                         style: TextStyle(
//                           fontSize: 30.0,
//                           fontWeight: FontWeight.w900,
//                           color: lightColorScheme.primary,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 40.0,
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Full name';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Full Name'),
//                           hintText: 'Enter Full Name',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           fullName = value;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Email';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Email'),
//                           hintText: 'Enter Email',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           email = value;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       TextFormField(
//                         obscureText: true,
//                         obscuringCharacter: '*',
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter Password';
//                           }
//                           return null;
//                         },
//                         decoration: InputDecoration(
//                           label: const Text('Password'),
//                           hintText: 'Enter Password',
//                           hintStyle: const TextStyle(
//                             color: Colors.black26,
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.black12,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onChanged: (value) {
//                           password = value;
//                         },
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: agreePersonalData,
//                             onChanged: (bool? value) {
//                               setState(() {
//                                 agreePersonalData = value!;
//                               });
//                             },
//                             activeColor: lightColorScheme.primary,
//                           ),
//                           const Text(
//                             'I agree to the processing of ',
//                             style: TextStyle(
//                               color: Colors.black45,
//                             ),
//                           ),
//                           Text(
//                             'Personal data',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: lightColorScheme.primary,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             if (_formSignupKey.currentState!.validate() && agreePersonalData) {
//                               await _handleSignUp();
//                               _showRegistrationPopup();
//                             } else if (!agreePersonalData) {
//                               _showSnackBar('Please agree to the processing of personal data');
//                             }
//                           },
//                           child: const Text('Sign up'),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Expanded(
//                             child: Divider(
//                               thickness: 0.7,
//                               color: Colors.grey.withOpacity(0.5),
//                             ),
//                           ),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 0,
//                               horizontal: 10,
//                             ),
//                             child: Text(
//                               'Sign up with',
//                               style: TextStyle(
//                                 color: Colors.black45,
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Divider(
//                               thickness: 0.7,
//                               color: Colors.grey.withOpacity(0.5),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30.0,
//                       ),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(icon: Icon(FontAwesomeIcons.facebook), onPressed:null),
//                           IconButton(icon: Icon(FontAwesomeIcons.twitter), onPressed:null),
//                           IconButton(icon: Icon(FontAwesomeIcons.instagram), onPressed:null),
//                           IconButton(icon: Icon(FontAwesomeIcons.google), onPressed:null),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 25.0,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             'Already have an account? ',
//                             style: TextStyle(
//                               color: Colors.black45,
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (e) => const SignInScreen(),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               'Sign in',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: lightColorScheme.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _handleSignUp() async {
//     try {
//       final newUser = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//
//       await _firestore
//           .collection('users')
//           .doc(newUser.user!.uid)
//           .set({
//         'fullName': fullName,
//         'email': email,
//       });
//
//     } catch (e) {
//       _showSnackBar('Error: $e');
//     }
//   }
//
//   void _showSnackBar(String message) {
//     _scaffoldKey.currentState!.showSnackBar(
//       SnackBar(
//         content: Text(message),
//       ),
//     );
//   }
//
//   void _showRegistrationPopup() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Registration Completed'),
//           content: const Text('Your account has been created successfully.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (BuildContext context) => const SignInScreen(),
//                   ),
//                 );
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:demo_app/screen/signin_screen.dart';
import 'package:demo_app/theme/theme.dart';
import 'package:demo_app/widgets/custom_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();
  String? selectedPreviousIllness;
  bool agreePersonalData = true;
  String fullName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String uhid = '';
  String previousIllness = '';
  String medication = '';
  List<String> previousIllnesses = [
    'No Previous Illness',
    'Depression',
    'Anxiety',
    'Bipolar Disorder',
    'Schizophrenia',
    'PTSD',
    'Other'
  ];
  TextEditingController medicationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    selectedPreviousIllness = previousIllnesses[0]; // Set initial value here
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox(
              height: 10,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: lightColorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Full Name'),
                          hintText: 'Enter Full Name',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          fullName = value;
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Email'),
                          hintText: 'Enter Email',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          } else if (!RegExp(r'^[a-zA-Z0-9_@#*]+$').hasMatch(value)) {
                            return 'Password can only contain alphabets, numbers, _, @, #, *';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          hintText: 'Enter Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),

                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Confirm Password';
                          } else if (value != password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('Confirm Password'),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          confirmPassword = value;
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter UHID';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          label: const Text('UHID'),
                          hintText: 'Enter UHID',
                          hintStyle: const TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          uhid = value;
                        },
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedPreviousIllness,
                        onChanged: (String? value) {
                          setState(() {
                            selectedPreviousIllness = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Previous Mental Illness',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black12,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        items: previousIllnesses
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: medicationController,
                              decoration: InputDecoration(
                                labelText: 'Medications (if any)',
                                hintText: 'Enter Medications',
                                hintStyle: const TextStyle(
                                  color: Colors.black26,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onChanged: (value) {
                                medication = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: agreePersonalData,
                            onChanged: (bool? value) {
                              setState(() {
                                agreePersonalData = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'I agree to the processing of ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'Personal data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formSignupKey.currentState!.validate() &&
                                agreePersonalData) {
                              await _handleSignUp();
                              _showRegistrationPopup();
                            } else if (!agreePersonalData) {
                              _showSnackBar(
                                  'Please agree to the processing of personal data');
                            }
                          },
                          child: const Text('Sign up'),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 10,
                            ),
                            child: Text(
                              'Sign up with',
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.7,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(FontAwesomeIcons.facebook),
                              onPressed: null),
                          IconButton(
                              icon: Icon(FontAwesomeIcons.twitter),
                              onPressed: null),
                          IconButton(
                              icon: Icon(FontAwesomeIcons.instagram),
                              onPressed: null),
                          IconButton(
                              icon: Icon(FontAwesomeIcons.google),
                              onPressed: null),
                        ],
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (e) => const SignInScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lightColorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleSignUp() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await _firestore.collection('users').doc(newUser.user!.uid).set({
        'fullName': fullName,
        'email': email,
        'uhid': uhid,
        'password': password,
        'previousIllness': previousIllness,
        'medication': medication,
      });

      // Send email verification
      await newUser.user!.sendEmailVerification();

    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  void _showSnackBar(String message) {
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _showRegistrationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Completed'),
          content: const Text('Your account has been created successfully. '
              'Please verify your email to continue.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const SignInScreen(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

