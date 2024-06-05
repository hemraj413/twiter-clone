import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/components/slide_page_route.dart';
import 'package:twitter_clone/home_page/add_post.dart';
import 'package:twitter_clone/home_page/all_posts.dart';
import 'package:twitter_clone/home_page/components/drawer_comp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String popupSetting = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
        title: Center(child: Image.asset('assets/images/icon.png',height: 30,width: 30,)),
        
        actions: [
          PopupMenuButton<String>(
            child:const Icon(Icons.settings),
            itemBuilder: (context) {
              return
              [ 
                PopupMenuItem(child: TextButton(
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text("sign out"),
                        Icon(Icons.logout)
                    ],
                  ),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                ))];
            
          },),
          
        ],
        ),
        drawer:const DrawerComp(),
        body:const AllPosts(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: (){
            Navigator.push(context, SlideRightPageRoute(page:const AddPostPage()));

        },
          child:const Icon(Icons.add, color: Colors.white,)),
        
    );
  }
}