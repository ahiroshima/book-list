import 'package:app/data/model/book.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookItem extends HookConsumerWidget {
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  static BorderRadius borderRadiusAll = BorderRadius.circular(8);
  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(8),
    topLeft: Radius.circular(8),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusAll),
      elevation: 4,
      child: InkWell(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                book.title ?? l10n.noTitle,
                style: theme.textTheme.h20.dense(),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Hero(
              tag: book,
              child: SizedBox(
                width: double.infinity,
                height: 150,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4),
                        child: ClipRRect(
                        borderRadius: borderRadiusTop,
                        child: networkImage(book.urlToMediumImage, fit: BoxFit.fitHeight),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              book.author ?? l10n.noTitle,
                              style: theme.textTheme.h20.dense(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              book.publisher ?? l10n.noTitle,
                              style: theme.textTheme.h20.dense(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2),
                            child: Text(
                              book.price ?? l10n.noTitle,
                              style: theme.textTheme.h20.dense(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () => router.push(DetailRoute(book: book)),
      ),
    );
  }
}
