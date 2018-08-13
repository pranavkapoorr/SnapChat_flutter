import 'package:flutter/material.dart';


Widget flipIcon(Icon icon){
  return new Transform(
    transform: new Matrix4.rotationY(2.5),
    child: icon,
  );
}