
import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors{
  Color? primary,
  primaryText,
  black,
  white,
  grey,
  userScoreBgColor,
  userScoreValueColor,
  userScoreBgColorSecond,
  secodaryTextColor;
  AppColors.light(){
    primary=Color(0XFF032541);
    primaryText=Colors.black;
    secodaryTextColor= Colors.grey;
    black=Colors.black;
    white=Colors.white;
    grey=Colors.grey;
    userScoreBgColor=Color(0XFF081C22);
    userScoreValueColor=Color(0XFF21D07A);
    userScoreBgColorSecond=Color(0XFF204528);
  }
  AppColors.dark(){
    primary=Color(0XFF032541);
    primaryText=Colors.white;
    secodaryTextColor= Colors.grey;
    black=Colors.black;
    white=Colors.white;
    grey=Colors.grey;
    userScoreBgColor=Color(0XFF081C22);
    userScoreValueColor=Color(0XFF21D07A);
    userScoreBgColorSecond=Color(0XFF204528);
  }
}