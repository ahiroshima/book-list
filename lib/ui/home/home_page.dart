import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    final homeViewModel = ref.read(homeViewModelProvider);

    return AutoTabsScaffold(
      routes: const [
        BooksRoute(),
        ScanRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: theme.appColors.accent,
          unselectedItemColor: theme.appColors.disabled,
          iconSize: 30,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: tabsRouter.current.name == BooksRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: l10n.home,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: tabsRouter.current.name == ScanRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: l10n.search,
            ),
          ],
        );
      },
      floatingActionButton: Visibility(
        visible: homeViewModel.isVisibleFab,
        child: FloatingActionButton(
          onPressed: () async {
            await homeViewModel.scanBarcode();
            // バーコード読み取りが成功の場合、登録画面を表示
            if (homeViewModel.scanResult != null &&
                homeViewModel.scanResult!.type == ResultType.Barcode) {
              router.push(const RegRoute());
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
