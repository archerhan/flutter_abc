/**
 * @author Archer
 * @date 2019-05-06
 * Description:
 */
import 'package:flutter/material.dart';

bool isSoftKeyboardDisplay(MediaQueryData data) {
	return data.viewInsets.bottom / data.size.height > 0.3;
}