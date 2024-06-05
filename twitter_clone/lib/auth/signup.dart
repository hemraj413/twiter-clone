import 'package:flutter/material.dart';
import 'package:twitter_clone/auth/signup_2.dart';

import 'package:twitter_clone/components/slide_page_route.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback toggleLogin;
  const SignUpPage({super.key, required this.toggleLogin});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
    DateTime? _selectedDate;

  @override
  void dispose() {
    birthdayController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        birthdayController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.15,),
          
            Column(
              children: [
                  const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text("Create new Account", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),),
              ],
            ),
            const SizedBox(height: 10,),
                TextField(
                  controller: nameController,
                  decoration:const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Full Name"),
                
                  ),
                ),
               
                  const SizedBox(height: 10,),
              TextField(
              controller: birthdayController,
              decoration: const InputDecoration(
                labelText: "Birthdate",
                hintText: "Pick your birthdate",
                suffixIcon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 20),
           
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
       
          
            SizedBox(height: MediaQuery.of(context).size.height*.25,),
            const Divider(thickness: .4,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    TextButton(onPressed: (){
                  widget.toggleLogin();

                }, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(width: .7,color: Colors.black),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child:const Text("Already have account? Login", style: TextStyle(fontWeight: FontWeight.w600),),
                )
                ),
                
                TextButton(onPressed: (){
                  if(_selectedDate!= null && nameController.text.trim().isNotEmpty){
                  Navigator.push(context, SlideRightPageRoute(page: SignupPage2(name:nameController.text.trim() ,)));


                  }

                }, child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black

                  ),
                  child:const Text("Next", style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                )
                )

              

            
          ],)
        
        ]);
  }
}