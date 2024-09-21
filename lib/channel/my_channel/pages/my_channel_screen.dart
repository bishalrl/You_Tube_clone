import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/channel/my_channel/pages/parts/buttons.dart';
import 'package:you_tube_clone/channel/my_channel/pages/parts/tab_bar.dart';
import 'package:you_tube_clone/channel/my_channel/pages/parts/tab_var_view.dart';
import 'package:you_tube_clone/channel/my_channel/pages/parts/top_header.dart';
import 'package:you_tube_clone/cores/screens/error_page.dart';
import 'package:you_tube_clone/cores/screens/loader.dart';
import 'package:you_tube_clone/features/auth/provider/user_provider.dart';
class MyChannelScreen extends ConsumerWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
      data: (currentUser)=>DefaultTabController(length: 7, child: Scaffold(
      body: SafeArea(child: 
      Padding(padding:  EdgeInsets.all(10),
      child: Column(
        children: [
          //top header of page
          TopHeader(user: currentUser,),
      
           Text("More about this channel"),

         //buttons
         Buttonss(),
          //create tab bar
          PageTabBar(),

          TabView(),
          
        ],
      ),
      )),
    )), 
    error: (error , StackTrace) => ErrorPage(), 
    loading: () => Loader());
  }
}