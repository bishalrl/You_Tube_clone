import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:you_tube_clone/channel/repository/edit_fields.dart';
import 'package:you_tube_clone/channel/widgets/edit_setting_dialog.dart';
import 'package:you_tube_clone/channel/widgets/setting_field_item.dart';
import 'package:you_tube_clone/cores/screens/error_page.dart';
import 'package:you_tube_clone/cores/screens/loader.dart';
import 'package:you_tube_clone/features/auth/provider/user_provider.dart';
class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwiched = false;
  bool isValidate =false;
validataUsername(String identifier) async {
  final usersMap = await FirebaseFirestore.instance.collection("users").get();
  final users = usersMap.docs.map((user) => user.data()["username"]).toList();

  // Check if the identifier already exists in the database
  if (users.contains(identifier)) {
    print("Not validated");
    setState(() {
      isValidate = false;
    });
  } else {
    print("Validated");
    setState(() {
      isValidate = true;
    });
  }

  return isValidate;
}

  

  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(data:(currentUser)=>Scaffold(
      body: SafeArea(child: 
      Padding(padding: EdgeInsets.only(top: 2),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 170,
                width: double.infinity,
                child: Image.asset("assets/images/flutter background.png",
                fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 175,
                top: 45,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  backgroundImage: CachedNetworkImageProvider(
                    currentUser.profilePic

                    
                  ),
                ),
              ),
              Positioned(
                right: 16,
                top: 10,
                child: Image.asset("assets/icons/camera.png",
              height: 35,
              color: Colors.white,))

            ],
          ),
          const SizedBox(height: 10,),
          //second part of setting i.e body 
        SettingsItem(identifier: "Name", 
       
       onPressed: () {
  showDialog(
    context: context,
    builder: (context) => SettingsDialog(
      identifier: "Your new name",
      onSave: (UserName) async {
        await validataUsername(UserName);
        if (isValidate == true) {
          await ref.watch(editSettingsProvider).editDisplayName(UserName);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Could not validate username, try another one.")),
          );
        }
      },
    ),
  );
},

        value: currentUser.username,
        ),
         SizedBox(height: 10,),
        SettingsItem(identifier: "Handle", 
        onPressed: (){
 showDialog(context: context, 
          builder:(context)=>
          SettingsDialog(identifier: "New Handle",onSave: (useremail){
            ref.watch(editSettingsProvider).editDisplayName(useremail);
          },) );
      
        }, 
        value: currentUser.email,
        ),
        const SizedBox(height: 10,),
        SettingsItem(identifier: "Description", 
        onPressed: (){
          showDialog(context: context, builder: (context)=>SettingsDialog(identifier: "Description",
          onSave: (description){
            ref.watch(editSettingsProvider).editDescription(description);
          },));
        }, 
        value: currentUser.description,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12,right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Keep all my subscribers private"),
            Switch(value: isSwiched, 
            onChanged: (value){
              isSwiched=value;
              setState(() {
                
              });
            }
            
            )
          ],),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 14),
          child: Text("Changes made on your name and profile are only to you and not other google services",
          style: TextStyle(
            color: Colors.grey
          ),
          textAlign: TextAlign.center,),
        )
          
        ],
      ),
      )
      ),
    )
  , error: (error,StackTrace)=> ErrorPage(), loading: ()=>Loader());  }
}