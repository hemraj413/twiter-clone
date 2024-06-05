import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home_page/components/menu_item.dart';

class DrawerComp extends StatefulWidget {
  const DrawerComp({super.key});

  @override
  State<DrawerComp> createState() => _DrawerCompState();
}

class _DrawerCompState extends State<DrawerComp> {

  User? _currentUser;

  @override
  void initState() {
    super.initState();
    getUserDataByEmail(_currentUser?.email??"");
    
  }

  Future<QuerySnapshot> getUserDataByEmail(String email) async {
  return await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .get();
}

  @override
  Widget build(BuildContext context) {
        _currentUser =FirebaseAuth.instance.currentUser;

    return Container(
      color: Colors.white,
          width: MediaQuery.of(context).size.width *.65,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              const Icon(Icons.person,size: 40,),
              const Text("", style: TextStyle(fontWeight: FontWeight.w700),),
              Text(_currentUser?.email??"@email",style:const TextStyle(fontWeight: FontWeight.w600) ,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("0 followers."),
                  SizedBox(width: 5,),
                  Text("13 following")
                ],
              ),
              const SizedBox(height: 5,),
              const Divider(),
              const SizedBox(height: 100,),

              const MenuItem(text: "Profile"),
              const MenuItem(text: "Contact"),
              const MenuItem(text: "Premium"),
              const MenuItem(text: "Who to follow"),
              

              
            ],
          ),
          
        );
  }
}