// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/contents/bottom_navigation.dart';
import 'package:you_tube_clone/cores/screens/error_page.dart';
import 'package:you_tube_clone/cores/screens/loader.dart';
import 'package:you_tube_clone/cores/screens/widgets/image_button.dart';
import 'package:you_tube_clone/features/auth/provider/user_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/youtube.jpg",
                  height: 36,
                ),
                const SizedBox(width: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: ImageButton(
                      image: "cast.png",
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                  child: ImageButton(
                    image: "notification.png",
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: ImageButton(
                      image: "search.png",
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                Consumer(builder: (context,ref,child){
                  return ref.watch(currentUserProvider).when(
                    data: (currentUser) => 
                    Padding(
                  padding: EdgeInsets.only(right: 13),
                  child: CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      currentUser.profilePic),
                    radius:15,
                    backgroundColor:Colors.grey               ),
                ),
                   error: (error,StackTrace)=> const ErrorPage() , 
                   loading:() => const Loader());
                }),

               
              ],
            ),
          ],
        ),
        
      ),
      bottomNavigationBar: BottomNavigation(
        onPressed: (index) {
          
        },
      ),
    );
  }
}