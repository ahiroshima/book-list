import 'package:app/data/model/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final mypageViewModelProvider =
    ChangeNotifierProvider((ref) => MypageViewModel(ref.read));

class MypageViewModel extends ChangeNotifier {
  MypageViewModel(this._reader);

  final Reader _reader;

}