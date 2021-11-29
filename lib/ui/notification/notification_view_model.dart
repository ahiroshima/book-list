import 'package:app/data/model/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationViewModelProvider =
    ChangeNotifierProvider((ref) => NotificationViewModel(ref.read));

class NotificationViewModel extends ChangeNotifier {
  NotificationViewModel(this._reader);

  final Reader _reader;

}