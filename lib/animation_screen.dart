import 'package:flutter/material.dart';
import 'package:lotie_animation_riv/riv_animation_screen.dart';
import 'package:lotie_animation_riv/single_animation.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        centerTitle: true,
        title: Text('Lotie & Riv Animation'),
      ) ,
      body: Column(
        children: [
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SingleLotieFiles()),
              );
            }, child: Text('Single Lotie Files')
            ),

          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RivAnimationScreen()),
            );
          }, child: Text('Riv Animation Files')
          )

        ],
      ),
    );
  }
}
