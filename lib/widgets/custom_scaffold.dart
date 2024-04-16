import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget{
  const CustomScaffold({super.key, this.child});
final Widget? child;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/images/bg-1.png'),
              fit: BoxFit.cover,
            ),
            SafeArea(
                child: child!,
            ),
          ],
        ),
    );
  }
}
