import 'package:flutter/material.dart';
class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Expanded(
            child: TabBarView(children: [
              Center(child: Text("Home",style: TextStyle(color: Colors.black),),),
              Center(child: Text("Videos"),),
              Center(child: Text("shorst"),),
              Center(child: Text("Playlist"),),
            
              Center(child: Text("community"),),
              Center(child: Text("channels"),),
              Center(child: Text("about"),),
            ]),
          );
  }
}