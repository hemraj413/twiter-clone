import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final DocumentSnapshot post;

  LikeButton({required this.post});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool liked = false;

  @override
  void initState() {
    super.initState();
    _checkIfLiked();
  }

  _checkIfLiked() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await widget.post.reference.collection('likes').doc(user.uid).get();
      setState(() {
        liked = doc.exists;
      });
    }
  }

  _toggleLike() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    DocumentReference likeRef = widget.post.reference.collection('likes').doc(user.uid);

    if (liked) {
      await likeRef.delete();
    } else {
      await likeRef.set({"likes":1});
    }

    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        liked ? Icons.thumb_up : Icons.thumb_up_off_alt,
        color: liked ? Colors.blue : Colors.grey,
      ),
      onPressed: _toggleLike,
    );
  }
}