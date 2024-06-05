import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home_page/components/post_liked.dart';

class PostComp extends StatelessWidget {
  final bool isDeleteEnable;
  final DocumentSnapshot postSnapshot;
  final Map<String,dynamic> post;
  const PostComp({super.key, required this.post, required this.isDeleteEnable,  required this.postSnapshot});

  @override
  Widget build(BuildContext context) {
    bool isLiked = false;

    void likePressed()async{
      isLiked = !isLiked;


    }

    void deletePost()async{
      await postSnapshot.reference.delete();
      

    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: .5),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.amber
                ),
                child: const Icon(Icons.person_2_sharp)),
                const SizedBox(width: 10,),
              Text(post["person"],style: const TextStyle(fontWeight: FontWeight.w800,),),
              const SizedBox(width: 30,),
              isDeleteEnable? PopupMenuButton<String>(
            itemBuilder: (context) {
              return
              [ 
                PopupMenuItem(child: TextButton(
                  child:const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Text("delete"),
                        Icon(Icons.delete)
                    ],
                  ),
                  onPressed: () {
                    deletePost();
                    Navigator.pop(context);

                  },
                ))];
            
          },):const Text("")
          //           TextButton(onPressed: (){
          
          // }, child:const Text("follow"))
          
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.centerLeft,
            child: Text(post['post'], maxLines: null,style:const TextStyle(fontSize: 23, fontWeight: FontWeight.w500,),)),
          Row(
            children: [
              Transform.scale(
                scale: .7,
                child: TextButton(onPressed: (){
                  likePressed();
                
                }, child: Row(children: [ LikeButton(post: postSnapshot), ],)),
              ),//Text(post["likes"].toString())
           
            ],
          ),
          const Divider(thickness: .5,)
        ],

      ),
    );
  }
}