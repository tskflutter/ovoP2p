import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassEffectCard extends StatelessWidget {
  const GlassEffectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.grey.shade200.withOpacity(0.5)),
            child: Center(
                child: Text(
              "Censored",
              style: TextStyle(fontSize: 30),
            )),
          ),
        ),
      ),
    );
  }
}
