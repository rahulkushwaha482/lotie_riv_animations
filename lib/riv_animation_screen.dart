import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as riv;

class RivAnimationScreen extends StatefulWidget {
  const RivAnimationScreen({super.key});

  @override
  State<RivAnimationScreen> createState() => _RivAnimationScreenState();
}

class _RivAnimationScreenState extends State<RivAnimationScreen> {

  late riv.RiveAnimationController _controller;

  /// Toggles between play and pause animation states
  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    // Use the simple animation to play and pause the nimations
    _controller = riv.SimpleAnimation('Demo');
    print(_controller.isActive);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Riv Animations'),centerTitle: true,),
      body: Center(
        child: riv.RiveAnimation.asset(
          fit: BoxFit.fitHeight,
          'assets/liquid_download.riv',
          controllers: [_controller],
          // Update the play state when the widget's initialized
          onInit: (artboard) => setState(() {

            /// To Check the list of animations available in riv file
            for (var animation in artboard.animations) {
              print(animation.name);
            }
            setState(() {});
          }),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        tooltip: isPlaying ? 'Pause' : 'Play',
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
