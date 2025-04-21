import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TypingSpinKit extends StatelessWidget {
  const TypingSpinKit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SpinKitPulse(
          color: Colors.white,
          size: 20.r,
        ),
      ],
    );
  }
}
