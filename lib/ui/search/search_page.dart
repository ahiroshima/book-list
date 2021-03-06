import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/search/search_view_model.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPage extends HookConsumerWidget with AutoRouteAware {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final scanViewModel = ref.read(scanViewModelProvider);
    final bookInfo =
        ref.watch(scanViewModelProvider.select((value) => value.bookInfo));

    const BorderRadius borderRadiusTop = BorderRadius.only(
      topRight: Radius.circular(8),
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
      bottomRight: Radius.circular(8),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(l10n.searchBook),
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
                          data.pageCount.toString() + ' ?????????',
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
                            await scanViewModel.addBook();
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
        ),
      ),
    );
  }
}
