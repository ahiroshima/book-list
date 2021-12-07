//import 'package:app/ui/mypage/mypage_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
//import 'package:app/ui/hook/use_router.dart';
//import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget with AutoRouteAware {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    //final router = useRouter();
    //final theme = ref.watch(appThemeProvider);
    //final mypageViewModel = ref.read(mypageViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(l10n.mypage),
        ),
      ),
      body: const SizedBox(),
    );
  }
}
