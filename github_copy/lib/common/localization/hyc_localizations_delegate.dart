/**
 * @author Archer
 * @date 2019-04-24
 * Description:
 */
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:github_copy/common/localization/default_localizations.dart';

class HycLocalizationsDelegate extends LocalizationsDelegate<HycLocalizations> {
  HycLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh' ].contains(locale.languageCode);
  }
  ///根据 locale 创建一个对象,用于提供当前locale 下文本显示
  @override
  Future<HycLocalizations> load(Locale locale) {
    return new SynchronousFuture<HycLocalizations>(new HycLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<HycLocalizations> old){
    return false;
  }

  static HycLocalizationsDelegate delegate = new HycLocalizationsDelegate();

}