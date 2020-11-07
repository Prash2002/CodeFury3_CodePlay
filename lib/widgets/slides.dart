import 'package:CodeFury3/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';



class IntroScreen extends StatefulWidget {

  @override
  IntroScreenState createState() => new IntroScreenState();
}
class IntroScreenState extends State<IntroScreen> {
 List<Slide> slides = new List();

 @override
 void initState() {
   super.initState();

   slides.add(
     new Slide(
       title: "1",
       description: "Find a perfect job for your skills",
      //  pathImage: "images/photo_eraser.png",
       backgroundColor: Color(0xffF15D4F),
     ),
   );
   slides.add(
     new Slide(
       title: "2",
       description: "Ye indulgence unreserved connection alteration appearance",
      //  pathImage: "images/photo_pencil.png",
       backgroundColor: Color(0xffFF9F24),
     ),
   );
   slides.add(
     new Slide(
       title: "3",
       description:
       "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
      //  pathImage: "images/photo_ruler.png",
       backgroundColor: Color(0xff6B79BB),
     ),
   );
 }

 void onPress() {
   Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
 }

 @override
 Widget build(BuildContext context) {
   return new IntroSlider(
     slides: this.slides,
     onDonePress: this.onPress,
     onSkipPress: this.onPress,
   );
 }
}