import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/cores/screens/widgets/flat_button.dart';
import 'package:you_tube_clone/features/auth/repository/user_data_Service.dart';

final formKey= GlobalKey<FormState>();
class UsernamePage extends ConsumerStatefulWidget {

  final String displayName;
  final String profilePic;
  final String email;
  


  const UsernamePage ( {required this.displayName,required this.profilePic, required this.email,});

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController usernameController =TextEditingController();
  bool isValidate = true;
  //validating
  void validataUsername()async{
    final usersMap=await FirebaseFirestore.instance.collection("users").get();
    final users=usersMap.docs.map((user) =>user).toList();
    String? targetedUsername;
     // Loop through each user to check for the matching username
  for (var user in users) {
    targetedUsername = user.data()["username"];

    // Ensure the username exists in the user data
    if (user.data()["username"] != null && usernameController.text == user.data()["username"]) {
     isValidate = false;
     setState(() {
       
     });
     if(usernameController.text!= targetedUsername){
      isValidate = true;
      setState(() {
        
      });

      
     } 
      return;
    }
  }

    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           const Padding(
              padding: EdgeInsets.symmetric(vertical: 26, horizontal: 30),
              child: Text(
                "Enter the username",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            Form(
              child: TextFormField(
                onChanged: (username){
                  validataUsername();
                },

                autovalidateMode: AutovalidateMode.always,
                validator: (username) {
                  return isValidate? null :"username already taken";
                },
                controller:usernameController ,
                key: formKey,
                  decoration: InputDecoration(
                      suffixIcon: isValidate? const Icon(Icons.verified_user_rounded):const Icon(Icons.cancel),
                      suffixIconColor: isValidate ? Colors.green:Colors.red,
                      hintText: "Inster Username",
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder:const  OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)))),
            ),
                        const Spacer(),
                        FlatButton(color:isValidate? Colors.green:Colors.green.shade100 ,onPressed:()async{
                          //add user data inside database
                        isValidate ? 
                                                  await ref.read(userDataServiceProvider).addUSerDataToFirestore(
                          displayName: widget.displayName, 
                          username: usernameController.text, 
                          email: widget.email, 
                          profilePic: widget.profilePic, subscriptions: [],
                          videos: 0, userId: '',
                          description: '',
                          type: "",
                           ):
                          null;

                        } ,text:"CONTINUE" ,)
          ],
        ),
      )),
    );
  }
}
