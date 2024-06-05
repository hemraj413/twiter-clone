
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home_page/components/post.dart';

class AllPosts extends StatefulWidget {
  const AllPosts({super.key});

  @override
  State<AllPosts> createState() => _AllPostsState();
}

class _AllPostsState extends State<AllPosts> {
  final User? _currentUser =FirebaseAuth.instance.currentUser;
  bool isDeleteEnable = false;
  final firestore = FirebaseFirestore.instance.collection("users");
  @override
  void initState() {
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('posts').snapshots(),
     builder:(context,snapshot){
      
      if(snapshot.hasData&& snapshot.data != null){
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
        Map<String,dynamic> userData = snapshot.data!.docs[index].data() as Map<String,dynamic>;

            return PostComp(post: userData,isDeleteEnable:userData['email']==_currentUser?.email?true:false,postSnapshot:snapshot.data!.docs[index] ,);
          
        },);
      }else{
       return const Center(child: CircularProgressIndicator(),);
      }
     } );
  }
}