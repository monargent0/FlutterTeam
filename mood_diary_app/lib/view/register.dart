import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mood_diary_app/view/login.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _pw1Controller;
  late TextEditingController _pw2Controller;

  late String? _idErrorText;
  late String? _nameErrorText;
  late String? _passErrorText;
  late String? _pass2ErrorText;

  late bool isRegistering;

  @override
  void initState() {
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _pw1Controller = TextEditingController();
    _pw2Controller = TextEditingController();

    _idErrorText = null;
    _nameErrorText = null;
    _passErrorText = null;
    _pass2ErrorText = null;

    isRegistering = false;

    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pw1Controller.dispose();
    _pw2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'SIGN UP',
          style: TextStyle(
              color: Color.fromARGB(255, 119, 216, 164),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: '?????? / ?????????',
                    errorText: _nameErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    hintText: '????????? ??????',
                    errorText: _idErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _pw1Controller,
                  decoration: InputDecoration(
                    hintText: '????????????',
                    errorText: _passErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: _pw2Controller,
                  decoration: InputDecoration(
                    hintText: '???????????? ??????',
                    errorText: _pass2ErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: isRegistering
                        ? Colors.grey
                        : const Color.fromARGB(255, 119, 216, 164),
                    fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (!isRegistering) {
                      checkRegist();
                    } else {
                      // print('registering');
                    }
                  },
                  child: Text(
                    isRegistering ? '?????? ???' : '???  ???  ???  ???',
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/signin');
                  },
                  child: const Text('????????????'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//---- Function
  checkRegist() async {
    setState(() {
      isRegistering = true;
    });

    //?????? ??????
    RegExp nameReg = RegExp(r"^[???-???]{2,6}$");
    RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    RegExp passReg =
        RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!nameReg.hasMatch((_nameController.text.trim()))) {
      setState(() {
        _nameErrorText = '2~6?????? ?????? ????????? ??????????????????';
      });
    } else {
      setState(() {
        _nameErrorText = null;
      });

      //????????? ??????
      if (!emailReg.hasMatch(_idController.text.trim())) {
        setState(() {
          _idErrorText = '????????? ???????????? ??????????????????';
        });
      } else {
        var url = Uri.parse(
            'http://192.168.5.222:8080/Flutter/daily_idCheck.jsp?id=${_idController.text.trim()}');
        var response = await http.get(url);
        var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
        bool isIdExist = dataConvertedJSON['results'];
        print(isIdExist);

        if (isIdExist) {
          setState(() {
            _idErrorText = '?????? ???????????? ID?????????.';
          });
        } else {
          setState(() {
            _idErrorText = null;
          });

          //???????????? ??????
          if (!passReg.hasMatch(_pw1Controller.text.trim())) {
            setState(() {
              _passErrorText = '??????, ??????, ??????????????? ????????? 8??? ???????????? ??????????????????';
            });
          } else {
            setState(() {
              _passErrorText = null;
            });

            //????????????2 ??????
            if (_pw1Controller.text != _pw2Controller.text) {
              setState(() {
                _pass2ErrorText = '???????????? ????????? ???????????? ????????????.';
              });
            } else {
              setState(() {
                _pass2ErrorText = null;
              });
              //??????

              var url = Uri.parse(
                  'http://192.168.5.83:8080/Flutter/daily_regist.jsp?uid=${_idController.text.trim()}&upw=${_pw1Controller.text.trim()}&uname=${_nameController.text.trim()}');
              var response = await http.get(url);
              var dataConvertedJSON =
                  jsonDecode(utf8.decode(response.bodyBytes));
              bool isSuccess = dataConvertedJSON['results'];
              // print(isSuccess);
              if (isSuccess) {
                setState(() {
                  _showDialog(context);
                });
              }
            }
          }
        }
      }
    }
    setState(() {
      isRegistering = false;
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('??????'),
            content: const Text('??????????????? ?????? ???????????????.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}
