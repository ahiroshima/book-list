import 'package:app/data/model/book.dart';
import 'package:app/ui/books/books_view_model.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_l10n.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:app/ui/route/app_route.dart';
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
    final booksViewModel = ref.read(booksViewModelProvider);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusAll),
      elevation: 4,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: <Widget>[
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
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(3),
              Text(
                book.title ?? l10n.noTitle,
                style: theme.textTheme.h20.dense(),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        onTap: () async {
          // 最新の本の情報を取得して詳細ページへ渡す
          // メモを戻り値としているが、元の本一覧ページでの再描画に利用できず未使用
          final Book currentBook = await booksViewModel.getBook(book.id);
          final result = await router.push(DetailRoute(book: currentBook));
          debugPrint('return : ' + result.toString());
        },
      ),
    );
  }
}
