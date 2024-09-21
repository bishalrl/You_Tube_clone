import 'package:flutter/material.dart';
import 'package:you_tube_clone/cores/colors.dart';
import 'package:you_tube_clone/cores/screens/widgets/image_button.dart';
class Buttonss extends StatelessWidget {
  const Buttonss({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
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
          );
  }
}