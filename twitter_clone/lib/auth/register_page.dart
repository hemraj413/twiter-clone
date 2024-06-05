import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:twitter_clone/auth/login.dart';
import 'package:twitter_clone/auth/signup.dart';
import 'package:twitter_clone/components/continue_google.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isLogin = false;
  bool isSignup = false;

  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height =MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
   
        title: Center(child: Image.asset('assets/images/icon.png',height: 30,width: 30,),),
        actions: [
            isLogin||isSignup?TextButton(
          onPressed: (){
            setState(() {
              isLogin = false;
              isSignup = false;

            });

          },
          child:const Text("×", style: TextStyle(fontSize: 40, color: Colors.black),),
        ):const Text('')
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child:isLogin?LOginPage(toggleSignup: ()=>setState(() {
            isLogin = false;
            isSignup = true;

          }),):Column(
            children: [
              isSignup? SignUpPage(toggleLogin: ()=>setState(() {
                isSignup = false;
                isLogin = true;
                
              }),):Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*.2,),
                  const Text("See what's happening in the world right now.", maxLines: null,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800),),
                  SizedBox(height:height*.2,),
              
                  const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContinueGoogle()
                    ],
                  ),
                  const SizedBox(height: 3,),
                  const Text("or"),
                  const SizedBox(height: 3,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSignup = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: width*.7,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black
                            
                          ),
                          child: const Text("Create new Account", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.white),),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(onPressed: (){
                        setState(() {
                          isLogin = true;
                        });
              
                      }, child:const Text("Login"))
              
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
    
  }
}