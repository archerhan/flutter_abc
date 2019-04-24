/**
 * @author Archer
 * @date 2019-04-24
 * Description:
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:github_copy/common/style/hyc_string_base.dart';
import 'package:github_copy/common/style/hyc_string_en.dart';
import 'package:github_copy/common/style/hyc_string_zh.dart';
/*
* 自定义多语言实现
* */
class HycLocalizations {
  final Locale locale;
  HycLocalizations(this.locale);
  ///根据不同locale.languageCode加载不同语言对应的字段
  static Map<String, HycStringBase> _localizedValues = {
    'en' : new HycStringEn(),
    'zh' : new HycStringZh(),
  };

  HycStringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过Localizations 加载当前的 HycLocalizations
  ///获取对应的HycStringBase
  static HycLocalizations of(BuildContext context) {
    return Localizations.of(context, HycLocalizations);
  }
}