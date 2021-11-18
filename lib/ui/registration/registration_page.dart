import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/home/home_view_model.dart';
import 'package:app/ui/registration/registration_view_model.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegistrationPage extends HookConsumerWidget with AutoRouteAware {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  void didPush() {
    homeViewModelProvider.select((value) => value.setVisibleFab(false));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final bookInfo = ref
        .watch(registrationViewModelProvider.select((value) => value.bookInfo));
    final scanResult = ref.watch(
        registrationViewModelProvider.select((value) => value.scanResult));
    final registrationViewModel = ref.read(registrationViewModelProvider);

    const BorderRadius borderRadiusTop = BorderRadius.only(
      topRight: Radius.circular(8),
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    );

    if (scanResult != null && scanResult.type == ResultType.Cancelled) {
      router.pop();
      return const Scaffold();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          if (bookInfo != null)
            bookInfo.when(success: (data) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      data.title.toString(),
                      style: theme.textTheme.h50.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(10),
                    Text(
                      data.subtitle.toString(),
                      style: theme.textTheme.h30.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(5),
                    Text(
                      data.description.toString(),
                      style: theme.textTheme.h30.dense(),
                      overflow: TextOverflow.clip,
                    ),
                    const Gap(10),
                    Text(
                      data.authors!.isNotEmpty
                          ? data.authors!.first.toString()
                          : '',
                      style: theme.textTheme.h40.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(5),
                    Text(
                      data.pageCount.toString() + ' ページ',
                      style: theme.textTheme.h40.dense(),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(5),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: borderRadiusTop,
                        child: networkImage(data.smallThumbnail,
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                    const Gap(20),
                    FloatingActionButton(
                      onPressed: () async {
                        await registrationViewModel.addBook();
                        router.pop();
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.add),
                    )
                  ],
                ),
              );
            }, failure: (e) {
              return Center(child: Text(l10n.fetchFailed));
            }),
        ],
      ),
    );
  }
}
