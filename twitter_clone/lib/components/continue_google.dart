import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/auth/google_auth_service.dart';

class ContinueGoogle extends StatelessWidget {
  const ContinueGoogle({super.key});

  @override
  Widget build(BuildContext context) {

    void onTap()async{
      try{
      signInWithGoogle();
            


      }on FirebaseAuthException catch(e){
        print(e);

      }
    }
    return GestureDetector(
      onTap: () =>onTap(),
      child: Container(
                          width: MediaQuery.of(context).size.width*.7,
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 22),
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.black, width: .7),
                            borderRadius: BorderRadius.circular(25)
                            
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Continue with ", style: TextStyle(fontSize: 20),),
                              Image.asset('assets/images/google.png',height: 20,width: 20,),
                        
                            ],
                          ),
                        ),
    );
  }
}