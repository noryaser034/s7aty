import 'package:flutter/material.dart';
import 'package:se7ety/features/doctor/complete_register/data/model/specialities.dart';

const Color skyBlue = Color(0xff71b4fb);
const Color lightBlue = Color(0xff7fbcfb);

const Color orange = Color(0xfffa8c73);
const Color lightOrange = Color(0xfffa9881);

const Color purple = Color(0xff8873f4);
const Color purpleLight = Color(0xff9489f4);

const Color green = Color(0xff4cd1bc);
const Color lightGreen = Color(0xff5ed6c3);

class CardModel {
  String specialization;
  Color cardBackground;
  Color cardLightColor;

  CardModel(this.specialization, this.cardBackground, this.cardLightColor);
}

List<CardModel> cards = [
  CardModel(specialities[0], skyBlue, lightBlue),
  CardModel(specialities[1], green, lightGreen),
  CardModel(specialities[2], orange, lightOrange),
  CardModel(specialities[3], purple, purpleLight),
  CardModel(specialities[4], green, lightGreen),
  CardModel(specialities[5], skyBlue, lightBlue),
  CardModel(specialities[6], green, lightGreen),
  CardModel(specialities[7], orange, lightOrange),
  CardModel(specialities[8], purple, purpleLight),
  CardModel(specialities[9], green, lightGreen),
  CardModel(specialities[10], skyBlue, lightBlue),
];
