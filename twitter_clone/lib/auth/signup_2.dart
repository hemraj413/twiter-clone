import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/auth/auth_page.dart';
import 'package:twitter_clone/components/slide_page_route.dart';

class SignupPage2 extends StatefulWidget {
  final String name;
  const SignupPage2({super.key, required this.name});

  @override
  State<SignupPage2> createState() => _SignupPage2State();
}

class _SignupPage2State extends State<SignupPage2> {
 String msg = '';
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signupPressed()async{
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if(email.isNotEmpty && password.isNotEmpty){
      setState(() {
        isLoading = true;
      });
      Map <String,dynamic> userData = {
        "email":email,
        "name":widget.name
        
      };

      try{

        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        await FirebaseFirestore.instance.collection("users").add(userData);
        setState(() {
          isLoading = false;
        });
        Navigator.pushAndRemoveUntil(context, SlideRightPageRoute(page:const AuthPage()), (route) => false);
      }on FirebaseAuthException catch(error){
        setState(() {
        msg = error.code.toString();
          isLoading = false;

          
        });

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('./assets/images/icon.png',height: 25,width: 25,)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*.15,),
                  Text("Hii ${widget.name},", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              const Text("Enter email password", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                TextField(
                  controller: emailController,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("email"),
                
                  ),
                ),
                  const SizedBox(height: 10,),
            TextField(
              controller: passwordController,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("password"),
                
              ),
              obscureText: true,
            ),
            Text(msg,style: const TextStyle(color: Colors.red),)
              ],
            ),
          
            SizedBox(height: MediaQuery.of(context).size.height*.35,),
            const Divider(thickness: .7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isLoading?Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black

                  ),
                  child: const CircularProgressIndicator(backgroundColor: Colors.white,strokeAlign: -5,)):TextButton(onPressed: (){
                  signupPressed();

                }, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black

                  ),
                  child:const Text("Sign up", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                )
                )
                
                          
          ],),

                ],
              ),
          
            
          ),
        ),
      
    );
  }
}