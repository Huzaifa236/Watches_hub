


import 'package:flutter/material.dart';
import 'package:watches_hub/Screens/Auth/login_screen.dart';
import 'package:watches_hub/Services/services.dart';

import '../../Constants/app_colors.dart';
import '../../Widgets/my_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _key =GlobalKey<FormState>();
  final AuthController _authController= AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: _key,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage("assets/watch.png",),
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  child: Column(
                    children: [
                      Text("SignUp Screen",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 4),),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: userController,
                          cursorColor: Colors.black,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Username is empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "User Name",
                              contentPadding: const EdgeInsets.only(left: 20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey.shade900,
                                    width: 3),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Colors.black,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Email is empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              contentPadding: const EdgeInsets.only(left: 20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey.shade900,
                                    width: 3),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          cursorColor: Colors.black,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Password is empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              contentPadding: const EdgeInsets.only(left: 20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.grey.shade900,
                                    width: 3),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                       MyButton(text: 'SignUp', onTap: (){
                         if(_key.currentState!.validate()){
                           _authController.signUp(userController.text,emailController.text.trim(), passwordController.text, context);
                         }
                       },),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          const Text("Already Have An Account? "),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const LoginScreen();
                            }));
                          }, child:const Text("Login"))
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
