import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_app/features/login/domain/entities/user.dart';

import '/generated/l10n.dart';
import '/core/shared/utils/style_repository.dart';
import '/core/shared/utils/colors_repository.dart';
import '/core/presentation/widgets/custom_button.dart';
import '/features/login/domain/bloc/login_bloc/login_bloc.dart';

///The FormLogin widget uses the context.read<LoginBloc>() method to access the
///[LoginBloc] instance. When the user submits the form, the FormLogin widget adds
/// a LoginEvent.started() event to the LoginBloc. The [LoginBloc] will then
/// handle the event and try to login the user.
class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  User user = User();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.login,
              style: extraLarge,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              style: medium.copyWith(color: ColorsRepository.realBlue),
              decoration:
                  inputTextFormField.copyWith(hintText: S.current.username),
              validator: (data) {
                if (data == null || data.isEmpty) {
                  return S.current.mandatoryField;
                }
                return null;
              },
              onSaved: (data) {
                user.username = data;
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return TextFormField(
                  keyboardType: TextInputType.name,
                  obscureText: obscureText,
                  style: medium.copyWith(color: ColorsRepository.realBlue),
                  decoration: inputTextFormField.copyWith(
                    hintText: S.current.password,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                      ),
                    ),
                  ),
                  onSaved: (data) {
                    user.password = data;
                  },
                  validator: (data) {
                    if (data == null || data.isEmpty) {
                      return S.current.mandatoryField;
                    }
                    return null;
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.current.forgotPassword,
                    textAlign: TextAlign.end,
                    style: small.copyWith(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),

            ///When the user submits the form, the Form widget will call the onPressed
            ///callback function for the submit button. The onPressed callback function
            ///can then submit the form data to the server or perform other actions.
            CustomButton(
              title: S.current.login,
              colorTitle: Colors.white,
              backgroundColor: ColorsRepository.realBlue,
              onPressed: () {
                ///The Form widget validates the input by calling the validator callback
                /// function for each form field. If the validator callback function
                /// returns an error message, the Form widget will mark the form field
                /// as invalid.
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.read<LoginBloc>().add(
                        LoginEvent.started(
                          userName: user.username!,
                          password: user.password!,
                        ),
                      );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
