import 'package:flutter/material.dart';

void main() => runApp(const LoginApp());

class LoginApp extends StatelessWidget{
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Login App UI',
      home: LoginStateApp(),
    );
  }
}

class LoginStateApp extends StatefulWidget{
  const LoginStateApp({super.key});

  @override
  State<LoginStateApp> createState() => _LoginStateApp();
}

class _LoginStateApp extends State<LoginStateApp>{
  //create form key
  final _userNameFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login UI with Flutter'),
      ),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: CircleAvatar(
                  backgroundImage: AssetImage('img/avatar.jpg'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: _userNameFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: TextFormField(
                          key: _userNameFormKey,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Enter your name to proceed';
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0)
                            ),
                            labelText: 'Enter your name'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Form(
                  key: _passwordFormKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: TextFormField(
                        key: _passwordFormKey,
                        obscureText: true,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter your to proceed';
                          }else if(value.length < 8){
                            return 'Password must have a minimum of 8 characters';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            labelText: 'Enter your password'
                        ),
                      ),
                    )
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Text(
                  'New User? Sign Up',
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: ElevatedButton(
                  onPressed: (){
                    if(_userNameFormKey.currentState!.validate() || _passwordFormKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        )
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: const Size(260, 50)
                  ),
                  child: const Text('Login'),
                ),
              )
            ],
          ),
        ),
      ),
      )
    );
  }
}