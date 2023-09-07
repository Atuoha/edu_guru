import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/enums/status.dart';

toastInfo({
  required String msg,
  required Status status,
}) {
  Fluttertoast.showToast(
    msg: msg,
    backgroundColor: status == Status.error ? Colors.red : Colors.green,
  );
}
