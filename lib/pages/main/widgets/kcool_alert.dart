import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import '../../../constants/color.dart';

Future kCoolAlert({
  required String message,
  required BuildContext context,
  required CoolAlertType alert,
  Function? action,
  barrierDismissible = true,
  confirmBtnText = 'Ok',
}) {
  return CoolAlert.show(
      backgroundColor: AppColors.primaryColor,
      confirmBtnColor: AppColors.secondaryColor,
      context: context,
      type: alert,
      text: message,
      onConfirmBtnTap: () => action!(),
      barrierDismissible: barrierDismissible,
      confirmBtnText: confirmBtnText);
}