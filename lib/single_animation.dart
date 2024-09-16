import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SingleLotieFiles extends StatefulWidget {
  const SingleLotieFiles({super.key});

  @override
  State<SingleLotieFiles> createState() => _SingleLotieFilesState();
}

class _SingleLotieFilesState extends State<SingleLotieFiles> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text('Lotie Animation'),),
      body: Center(
       child:  GestureDetector(
         onTap: (){
           Future.delayed(
               const Duration(
                   microseconds: 1),
                   () {
                 _controller
                     .forward();
               });

           if (_controller
               .isAnimating) {
             Future.delayed(
                 const Duration(
                     microseconds:
                     1), () {
               _controller
                   .stop();
             });
           }
         },
         child: Lottie.network(
           controller: _controller,
           onLoaded: (composition){
             _controller
               ..duration = composition.duration
               ..forward();
           },
             frameRate: const FrameRate(100),

             height: 200,
              width: 200,
              fit: BoxFit.fill,
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
       ),
      ),
    );
  }
}