import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/scan/scan_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScanPage extends HookConsumerWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final scanViewModel = ref.read(scanViewModelProvider);
    final bookInfo = ref.watch(scanViewModelProvider.select((value) => value.bookInfo));

    const BorderRadius borderRadiusTop = BorderRadius.only(
      topRight: Radius.circular(8),
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    );

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 85,
        leading: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter ISBN Code',
                  ),
                  onSubmitted: scanViewModel.searchBook,
                ),
              ),

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
                            child: networkImage(data.smallThumbnail, fit: BoxFit.fitHeight),
                          ),
                        ),
                        const Gap(20),
                        FloatingActionButton(
                          onPressed: scanViewModel.addBook,
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
        ),
      ),
    );
  }
}
