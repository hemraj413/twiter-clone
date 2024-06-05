import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LOginPage extends StatefulWidget {
  final VoidCallback toggleSignup;
  const LOginPage({super.key, required this.toggleSignup});

  @override
  State<LOginPage> createState() => _LOginPageState();
}

class _LOginPageState extends State<LOginPage> {
  String msg = '';
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginPressed()async{
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if(email.isNotEmpty && password.isNotEmpty){

      try{

        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      }on FirebaseAuthException catch(error){
        setState(() {
        msg = error.code.toString();
          
        });

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return 
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.15,),
          
            Column(
              children: [
                  const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text("Enter Email, Password", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),),
              ],
            ),
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
            const SizedBox(height: 10,),
            Text(msg, style:const TextStyle(color: Colors.red),)
              ],
            ),
            const SizedBox(height: 20,),
      
            SizedBox(height: MediaQuery.of(context).size.height*.30,),
            const Divider(thickness: .7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  widget.toggleSignup();

                }, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: .7,color: Colors.black),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child:const Text("Create new account", style: TextStyle(fontWeight: FontWeight.w600),),
                )
                ),
                
           
                TextButton(onPressed: (){
                  loginPressed();

                }, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black

                  ),
                  child:const Text("Log in", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                )
                )
                
              

            
          ],),
      
        ]);
  }
}