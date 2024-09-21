import 'package:cached_network_image/cached_network_image.dart';
import'package:flutter/material.dart';
import 'package:you_tube_clone/features/auth/model/user_model.dart';
class TopHeader extends StatelessWidget {
  final UserModel user;
  const TopHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return   Column(children: [
           Center(
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(user.profilePic),
            ),
          ),
           Text(user.displayName,style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RichText(text: 
             TextSpan(
              style: TextStyle(color: Colors.blueGrey),
              children: [
                TextSpan(text: "${user.username}"),
                TextSpan(text: "${user.subscriptions.length} subscription"),
                TextSpan(text: "${user.videos} videos"),
              ]
            )),
          ),
    ],);
  }
}