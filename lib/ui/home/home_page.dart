import 'package:app/gen/assets.gen.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:app/ui/hook/use_router.dart';
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: tabsRouter.setActiveIndex,
          iconSize: 20,
          items: [
            BottomNavigationBarItem(
              icon: Assets.svgs.news.svg(
                width: 20,
                color: tabsRouter.current.name == BooksRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: l10n.news,
            ),
            BottomNavigationBarItem(
              icon: Assets.svgs.video.svg(
                width: 20,
                color: tabsRouter.current.name == ScanRoute.name
                    ? theme.appColors.accent
                    : theme.appColors.disabled,
              ),
              label: l10n.news,
            ),
          ],
        );
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          router.push(const RegistrationRoute());
          homeViewModel.scanBarcode();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
