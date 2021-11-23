import 'package:app/data/model/book.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gap/gap.dart';

class DetailPage extends HookConsumerWidget {
  const DetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              // 縦軸の中央にColumnを表示する為
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  book.title ?? l10n.noTitle,
                  style: theme.textTheme.h50.dense(),
                  overflow: TextOverflow.visible,
                ),
                const Gap(10),
                Text(
                  book.subtitle ?? '',
                  style: theme.textTheme.h40.dense(),
                  overflow: TextOverflow.ellipsis,
                ),
                const Gap(20),
                networkImage(book.thumbnail),
                const Gap(50),
                Text(
                  book.description ?? '',
                  style: theme.textTheme.h30.dense(),
                  overflow: TextOverflow.visible,
                ),
                const Gap(10),
                Text(
                  book.authors!.isNotEmpty ? book.authors?.first ?? '' : '',
                  style: theme.textTheme.h30.dense(),
                  overflow: TextOverflow.visible,
                ),
                const Gap(10),
                Text(
                  l10n.isbn + book.isbn.toString(),
                  style: theme.textTheme.h30.dense(),
                ),
                const Gap(10),
                Text(
                  l10n.page + book.pageCount.toString(),
                  style: theme.textTheme.h30.dense(),
                ),
                const Gap(10),
                Text(
                  book.publishedDate?.toString() ?? '',
                  style: theme.textTheme.h30.dense(),
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
        onTap: router.pop,
      ),
    );
  }
}
