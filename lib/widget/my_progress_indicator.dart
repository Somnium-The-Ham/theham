import 'package:flutter/material.dart';

class MyProgressIndicator extends StatelessWidget {

  final double containerSize;
  final double progressSize;

const MyProgressIndicator(
{
  Key key, this.containerSize, this.progressSize = 30,
}
    ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: null,
      height: null,
      child: Center(
        child: SizedBox(
          width: 30,
          height: 30,
          child: Image.asset('assets_insta/loading_img.gif'),
        ),
      ),
    );
  }
}
