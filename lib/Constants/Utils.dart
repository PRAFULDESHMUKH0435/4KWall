import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class Utils{
  static void FlushBar(BuildContext context,String message,Color color,IconData icon){
    showFlushbar(context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
        borderRadius: const BorderRadius.all(Radius.circular(14.0)),
        flushbarPosition: FlushbarPosition.BOTTOM,
        icon: Icon(icon),
      )..show(context),
    );
  }
}