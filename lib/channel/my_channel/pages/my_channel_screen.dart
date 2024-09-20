import 'package:flutter/material.dart';
import 'package:you_tube_clone/cores/colors.dart';
import 'package:you_tube_clone/cores/screens/widgets/image_button.dart';
class MyChannelScreen extends StatelessWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 7, child: Scaffold(
      body: SafeArea(child: 
      Padding(padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 45,
              backgroundColor: Colors.grey,
            ),
          ),
          const Text("Bishal Aryal",style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: RichText(text: 
            const TextSpan(
              style: TextStyle(color: Colors.blueGrey),
              children: [
                TextSpan(text: "@aryalbishal"),
                TextSpan(text: "subscription"),
                TextSpan(text: "No videos"),
              ]
            )),
          ),
          const Text("More about this channel"),

          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 44,
                decoration: BoxDecoration(
                  color: softBlueGreyBackGround,
                  borderRadius: BorderRadius.circular(9)
                ),
                child: TextButton(onPressed: (){},child: Text("Manage Videos"),),
                          ),
              ),
            Expanded(child: ImageButton(onPressed: (){}, image: "pen.png", haveColor:true)),
            Expanded(child: ImageButton(onPressed: (){}, image: "time-watched.png", haveColor: true))
            
            ],),
          ),
          //create tab bar
          const Padding(
            padding: const EdgeInsets.only(top: 0),
            child: TabBar(
              isScrollable: true,
              labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding:EdgeInsets.only(top:1) ,
              
              tabs: [
              Text("Home"),
              Text("Videos"),
              Text("shorts"),
              Text("Playlist"),

              Text("community"),
              Text("channels"),
              Text("about"),

            ]),
          ),

          const Expanded(
            child: TabBarView(children: [
              Center(child: Text("Home",style: TextStyle(color: Colors.black),),),
              Center(child: Text("Videos"),),
              Center(child: Text("shorst"),),
              Center(child: Text("Playlist"),),
            
              Center(child: Text("community"),),
              Center(child: Text("channels"),),
              Center(child: Text("about"),),
            ]),
          )
          
        ],
      ),
      )),
    ));
  }
}