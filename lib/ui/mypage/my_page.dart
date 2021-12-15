import 'package:app/ui/mypage/mypage_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPage extends HookConsumerWidget with AutoRouteAware {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final mypageViewModel = ref.read(mypageViewModelProvider);

    mypageViewModel.initSelected(5);
    List<Widget> _menuItems = [
      _menuItem(0, l10n.signIn, const Icon(Icons.login), ref, router),
      _menuItem(1, l10n.collection, const Icon(Icons.collections), ref, router),
      _menuItem(2, l10n.inquiry, const Icon(Icons.help), ref, router),
      _menuItem(3, l10n.version, const Icon(Icons.pin), ref, router),
      _menuItem(4, l10n.license, const Icon(Icons.grading), ref, router),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(l10n.mypage),
        ),
      ),
      body: ListView(
        children: List.generate(_menuItems.length, (index) {
          return _menuItems[index];
        }),
      ),
    );
  }

  Widget _menuItem(
      int index, String title, Icon icon, WidgetRef ref, StackRouter router) {
    final theme = ref.watch(appThemeProvider);
    final mypageViewModel = ref.read(mypageViewModelProvider);

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1.0, color: theme.appColors.accent))),
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(color: theme.appColors.accent, fontSize: 18.0),
        ),
        onTap: () {
          mypageViewModel.setSelected(index);
          selectedAction(index, router);
          //print(index.toString() + " onTap called.");
        },
        onLongPress: () {
          //print("onLongPress called.");
        },
      ),
    );
  }

  void selectedAction(int index, StackRouter router) {
    // TODO: 各メニューの実装
    switch (index) {
      case 0:
        router.push(const SignInRoute());
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      default:
    }
  }
}
