import 'package:flutter/material.dart';



class CustomLoader extends StatelessWidget {
  final double height;
  final double width;
  const CustomLoader({
    super.key,
    this.height = 60,
    this.width = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.green),
        ),
      ),
    );
  }
}
