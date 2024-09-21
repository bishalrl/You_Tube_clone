import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:you_tube_clone/cores/screens/widgets/flat_button.dart';


class UserChannelPage extends StatefulWidget {
  const UserChannelPage({super.key});

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  bool haveVideos = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: 
      Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset("assets/images/flutter background.png"),
           Padding(
             padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
             child: Row(children:[
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
             
              ),

              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Bishal Aryal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Colors.blueGrey),),
                   const Text("@bishalaryal.com",style: TextStyle( fontSize: 13,fontWeight: FontWeight.w500,color: Colors.blueGrey),),
                             
                    RichText(
                      
                      text:const TextSpan(
                        style: TextStyle(color:Colors.blueGrey),
                        children:[
                          TextSpan(text:"No. Subscription",style: TextStyle( fontSize: 13,fontWeight: FontWeight.w500,color: Colors.blueGrey)),
                          TextSpan(text: "No Videos",style: TextStyle( fontSize: 13,fontWeight: FontWeight.w500,color: Colors.blueGrey)),
                             
                        ]
                    
                      
                    ) )
                             
                  ],
                ),
              ),
              
                       ]),
                       
           ),
           Padding(
                padding: const EdgeInsets.only(top: 15,left: 8,right: 8),
                child: SizedBox(child: FlatButton(text: "SUBSCRIBE", onPressed: (){}, color: Color.fromARGB(255, 137, 85, 81)),width: double.infinity,),
              ),


           //condition to show videos
           Padding(
             padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.2),
             child: haveVideos? SizedBox():Center(child: Text("No Videos",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),)),
           )



        ],
      ),)),
    );
  }
}