import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle defaultTextlabelStyle = GoogleFonts.lato(
    color: Colors.black, fontSize: 12, decoration: TextDecoration.none);
TextStyle defaultTextStyleTitlePage = GoogleFonts.lato(
    color: Colors.white, fontSize: 38, decoration: TextDecoration.none);
TextStyle defaultTextStyleSubtitle = GoogleFonts.lato(
    color: Colors.teal, fontSize: 18, decoration: TextDecoration.none);
TextStyle defaultTextStyle = GoogleFonts.lato(
    color: Colors.black, fontSize: 14, decoration: TextDecoration.none);
TextStyle defaultTextStyleInput = GoogleFonts.lato(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    decoration: TextDecoration.none);
TextStyle defaultTextStyleUserTitle = GoogleFonts.lato(
    color: Colors.white, fontSize: 14, decoration: TextDecoration.none);
TextStyle defaultTextlabelBoldStyle = GoogleFonts.lato(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none);
TextStyle defaultTextTitleStyle = GoogleFonts.lato(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    fontSize: 20);
TextStyle defaultTextStyleBold =
    GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w500);


// Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.all(8),
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.teal)),
//                     child: Material(
//                       child: TextField(
//                         keyboardType: TextInputType.number,
//                         maxLength: 2,
//                         style: defaultTextStyleInput,
//                         decoration: const InputDecoration(
//                           counterText: '',
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'Total parcial',
//                     style: defaultTextlabelStyle,
//                   )
//                 ],
//               )