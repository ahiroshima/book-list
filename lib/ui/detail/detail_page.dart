import 'package:app/data/model/book.dart';
import 'package:app/ui/component/image/image.dart';
import 'package:app/ui/hook/use_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailPage extends HookWidget {
  const DetailPage({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book? book;

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: book!,
            child: networkImage(book?.urlToLargeImage),
          ),
        ),
        onTap: router.pop,
      ),
    );
  }
}
