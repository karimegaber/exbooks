import 'package:exbooks/resources/fonts_manager.dart';
import 'package:exbooks/resources/language_manager.dart';
import 'package:exbooks/utils/utils.dart';
import 'package:flutter/material.dart';


TextStyle _getTextStyle(
    {required double fontSize,
      required FontWeight fontWeight,
      required Color color}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: getAppLanguage().toString() == LanguageType.ENGLISH.getValue()
        ? FontConstants.englishFontFamily
        : FontConstants.arabicFontFamily,
  );
}

//Regular Style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.regular,
  );
}

//Medium Style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.medium,
  );
}

//Light Style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.light,
  );
}

//Bold Style
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.bold,
  );
}

//Medium Style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: FontWeightManager.semiBold,
  );
}