
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  User? user = FirebaseAuth.instance.currentUser;
  final TextEditingController _controller = TextEditingController();
  // final ImagePicker _picker = ImagePicker();
  // XFile? _imageFile;

  // Future<void> _pickImage() async {
  //   final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  
  // }

  // void _post() {
  //   // Handle post action
  //   print("Post content: ${_controller.text}");
  //   if (_imageFile != null) {
  //     print("Image path: ${_imageFile!.path}");
  //   }
  // }

 
   void addPost()async{
    final String post = _controller.text.trim();
    QuerySnapshot userData = await FirebaseFirestore.instance.collection('users').where("email",isEqualTo: user!.email).get();

    if(post != ''){
      for(QueryDocumentSnapshot data in userData.docs ){
        Map<String,dynamic> userAllData = data.data() as Map<String,dynamic>;
          Map<String,dynamic> postData ={
        "post":post,
        "likes":0,
        "person":userAllData["name"]??"unknown user",
        "email":user?.email,
        "dislikes":0,
        "postedTime":DateTime.now()

      };
          try{
        await FirebaseFirestore.instance.collection('posts').add(postData);
        
      }catch(e){
        debugPrint(e.toString());
      }


      }
    
  
    }
     

    }

  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=>Navigator.pop(context),icon:const Icon(Icons.cancel),),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.lightBlue,
            ),
            child: TextButton(
              onPressed:(){
                addPost();
                if(_controller.text.trim()!=''){
                  Navigator.pop(context);
                }
              },
              child: const Text(
                'Post',
                style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              
              controller: _controller,
              maxLines: 13,
              decoration: const InputDecoration(
                hintText: 'What\'s happening?',
                border: InputBorder.none,
              ),
            ),
            // const SizedBox(height: 10),
            // if (_imageFile != null)
            //   Image.file(File(_imageFile!.path)),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.image),
            //       onPressed: _pickImage,
            //     ),
            //     // You can add more buttons here for other media types
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
