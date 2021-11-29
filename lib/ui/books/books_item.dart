import 'package:app/data/model/book.dart';
import 'package:app/ui/route/app_route.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BookItem extends HookConsumerWidget {
  const BookItem({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  static BorderRadius borderRadiusAll = BorderRadius.circular(8);
  static BorderRadius borderRadiusTop = const BorderRadius.only(
    topRight: Radius.circular(4),
    topLeft: Radius.circular(4),
    bottomLeft: Radius.circular(4),
    bottomRight: Radius.circular(4),
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
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
              Text(
                book.title ?? l10n.noTitle,
                style: theme.textTheme.h20.dense(),
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(3),
              /*book.subtitle != null
                  ? Text(
                      book.subtitle.toString(),
                      style: theme.textTheme.h20.dense(),
                      overflow: TextOverflow.ellipsis,
                    )
                  : const Gap(0),*/
              Hero(
                tag: book,
                child: SizedBox(
                  width: double.infinity,
                  height: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: borderRadiusTop,
                            child: networkImage(book.smallThumbnail,
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      /*Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Gap(10),
                            book.authors != null && book.authors!.isNotEmpty
                                ? Text(
                                    book.authors!.first,
                                    style: theme.textTheme.h20.dense(),
                                  )
                                : const Gap(0),
                            const Gap(5),
                            book.pageCount != 0
                                ? Text(
                                    l10n.page + book.pageCount.toString(),
                                    style: theme.textTheme.h20.dense(),
                                  )
                                : const Gap(0),
                            const Gap(5),
                            book.price != null
                                ? Text(
                                    book.price.toString(),
                                    style: theme.textTheme.h20.dense(),
                                  )
                                : const Gap(0),
                            const Gap(5),
                            book.publishedDate != null
                                ? Text(
                                    book.publishedDate.toString(),
                                    style: theme.textTheme.h20.dense(),
                                  )
                                : const Gap(0),
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () => router.push(DetailRoute(book: book)),
      ),
    );
  }
}
