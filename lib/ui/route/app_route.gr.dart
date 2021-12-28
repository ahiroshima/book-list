// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/data/model/book.dart' as _i11;
import 'package:app/ui/books/books_page.dart' as _i5;
import 'package:app/ui/detail/detail_page.dart' as _i3;
import 'package:app/ui/home/home_page.dart' as _i1;
import 'package:app/ui/mypage/my_page.dart' as _i8;
import 'package:app/ui/notification/notification_page.dart' as _i7;
import 'package:app/ui/registration/reg_page.dart' as _i4;
import 'package:app/ui/search/search_page.dart' as _i6;
import 'package:app/ui/signIn/sign_in_page.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.SignInPage(),
          fullscreenDialog: true);
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.DetailPage(key: args.key, book: args.book),
          fullscreenDialog: true);
    },
    RegRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i4.RegPage(),
          fullscreenDialog: true);
    },
    BooksRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.BooksPage());
    },
    SearchRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.SearchPage());
    },
    NotificationRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.NotificationPage());
    },
    MyRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.MyPage());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(HomeRoute.name, path: '/', children: [
          _i9.RouteConfig(BooksRoute.name,
              path: 'books', parent: HomeRoute.name),
          _i9.RouteConfig(SearchRoute.name,
              path: 'book_scan', parent: HomeRoute.name),
          _i9.RouteConfig(NotificationRoute.name,
              path: 'notification', parent: HomeRoute.name),
          _i9.RouteConfig(MyRoute.name, path: 'mypage', parent: HomeRoute.name)
        ]),
        _i9.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i9.RouteConfig(DetailRoute.name, path: '/detail'),
        _i9.RouteConfig(RegRoute.name, path: '/reg')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/signIn');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.DetailPage]
class DetailRoute extends _i9.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i10.Key? key, required _i11.Book book})
      : super(DetailRoute.name,
            path: '/detail', args: DetailRouteArgs(key: key, book: book));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.book});

  final _i10.Key? key;

  final _i11.Book book;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, book: $book}';
  }
}

/// generated route for
/// [_i4.RegPage]
class RegRoute extends _i9.PageRouteInfo<void> {
  const RegRoute() : super(RegRoute.name, path: '/reg');

  static const String name = 'RegRoute';
}

/// generated route for
/// [_i5.BooksPage]
class BooksRoute extends _i9.PageRouteInfo<void> {
  const BooksRoute() : super(BooksRoute.name, path: 'books');

  static const String name = 'BooksRoute';
}

/// generated route for
/// [_i6.SearchPage]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute() : super(SearchRoute.name, path: 'book_scan');

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i7.NotificationPage]
class NotificationRoute extends _i9.PageRouteInfo<void> {
  const NotificationRoute()
      : super(NotificationRoute.name, path: 'notification');

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i8.MyPage]
class MyRoute extends _i9.PageRouteInfo<void> {
  const MyRoute() : super(MyRoute.name, path: 'mypage');

  static const String name = 'MyRoute';
}
