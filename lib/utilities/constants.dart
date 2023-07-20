import 'package:flutter/material.dart';

const BoxDecoration kStyleBoxDecoration = (BoxDecoration(
  gradient: LinearGradient(
    colors: [Color(kDarkestBlue), Color(kMediumBlue)],
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black,
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
      spreadRadius: 2.0,
    ),
  ],
  color: Color(kDarkestBlue),
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20.0),
    bottomRight: Radius.circular(0.0),
    topLeft: Radius.circular(0.0),
    bottomLeft: Radius.circular(20.0),
  ),
));
final ButtonStyle kStyleElevatedButton = ElevatedButton.styleFrom(
  side: const BorderSide(width: 2, color: Color(kLightestBlue), style: BorderStyle.solid),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(buttonRadiusValue),
  ),
  backgroundColor: const Color(kDarkBlue),
  padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 0.0, bottom: 0.0),
  elevation: 25.0,
  shadowColor: const Color(kLightestBlue),
  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: kFontTypeForApp, color: Color(lightBlue)),
);
const double kContainerHeight = 110.0;
const double kContainerFontHeight = 14.0;
const double kAppBarFontHeight = 20.0;
const String kFontTypeForApp = 'Roboto-Thin';
const double kFontHeightMedium = 14.0;
const double kFontHeightSmall = 12.0;
const double kFontHeightLarge = 20.0;
const int kFontColor = 0xFFFFFFFF;
const int kIconColor = 0xFFFF0000;
const String kHsaYouTubeUrl = 'https://www.youtube.com/channel/UC5ymqSnOM51K7USJ__lIz8w';
const String kHsaNewsLetterUrl = 'http://www.huestonsailing.com/HSA_Newsletter.html';
const double kSocialMediaIconHeight = 50.0;
const double kSocialMediaIconWidth = 135.0;
const double kSocialMediaFontHeight = 10.0;
const double iconHeightValue = 60.0;
const double buttonRadiusValue = 12.0;
const double kButtonRowSpacingTop = 1.0;
const double buttonRowSpacingBottom = 20.0;
const double kWidthElevatedButton = 110.0;
const double kHeightElevatedButton = 65.0;
const double kWidthSpringResultsElevatedButton = 200.0;
const double kHeightSpringResultsElevatedButton = 75.0;
const double logoHeightValue = 200.0;
const double logoWidthValue = 300.0;
const int kDarkestBlue = 0xFF0B2447;
const int kDarkBlue = 0xFF19376D;
const int kMediumBlue = 0xFF576CBC;
const int scaffoldColor = 0xFFA5D7E8;
const int kLightestBlue = 0xFFA5D7E8;
const int lightBlue = 0xFFFFFFFF;
const double fontSizeValue = 16.0;
const String copyRightText = 'Hueston Sailing Association: All Rights Reserved 2023';
const double textContainerHeight = 140.0;
const double textContainerWidth = 500.0;
const double textContainerFontHeight = 18.0;

// Color Palette for App
const int kDarkestGreen = 0xFF002B5B;
const int kDarkGreen = 0xFF1A5F7A;
const int kMediumGreen = 0xFF159895;
const int kLightGreen = 0x0FF57C5B6;
