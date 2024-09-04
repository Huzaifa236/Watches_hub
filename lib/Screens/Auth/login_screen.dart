


import 'package:flutter/material.dart';
import 'package:watches_hub/Screens/Auth/signup_screen.dart';

import '../../Constants/app_colors.dart';
import '../../Services/auth_services.dart';
import '../../Widgets/my_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    final AuthController authController= AuthController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
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
                   Text("Login Screen",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 4),),
                 ],
               ),
             ),
              SizedBox(
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextFormField(
                          controller: emailController,
                          cursorColor: Colors.black,
                          validator: (value){
                            if(value == null){
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
                            if(value == null){
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
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: (){
                            if(key.currentState!.validate()){
                              authController.forgetPassword(emailController.text, context);
                            }
                            return;
                          }, child: const Text("Forget Password?"))),
                      const SizedBox(height: 10),
                      MyButton(text: 'Login', onTap: (){
                        if(key.currentState!.validate()){
                          authController.login(emailController.text, passwordController.text, context);
                        }
                        return;
                      },),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          const Text("Don't Have An Account? "),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const SignUpScreen();
                            }));
                          }, child:const Text("SignUp"))
                        ],
                      )

                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
