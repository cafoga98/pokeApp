import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/generated/l10n.dart';
import '/core/shared/utils/style_repository.dart';
import '/core/shared/utils/images_reporitory.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 80.h,
        ),
        Text(
          S.current.singUp,
          textAlign: TextAlign.end,
          style: medium.copyWith(
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageRepository.gmailIcon,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
            Image.asset(
              ImageRepository.facebookIcon,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
            Image.asset(
              ImageRepository.emailIcon,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
