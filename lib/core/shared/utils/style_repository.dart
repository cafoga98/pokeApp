import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/shared/utils/colors_repository.dart';

final extraLarge = TextStyle(
  fontFamily: 'ChakraPetch',
  fontWeight: FontWeight.bold,
  fontSize: 31.sp,
  color: Colors.white,
);

final large = TextStyle(
  fontFamily: 'ChakraPetch',
  fontSize: 26.sp,
  color: Colors.black,
);

final medium = TextStyle(
  fontFamily: 'ChakraPetch',
  fontSize: 19.sp,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final small = TextStyle(
  fontFamily: 'ChakraPetch',
  fontSize: 17.sp,
  color: ColorsRepository.realBlue,
);

InputDecoration inputTextFormField = InputDecoration(
  hintStyle: medium.copyWith(color: Colors.grey),
  isDense: true,
  filled: true,
  fillColor: Colors.white,
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
  ),
);
