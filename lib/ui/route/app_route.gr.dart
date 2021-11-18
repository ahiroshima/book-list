// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/data/model/book.dart' as _i9;
import 'package:app/ui/books/books_page.dart' as _i5;
import 'package:app/ui/detail/detail_page.dart' as _i3;
import 'package:app/ui/home/home_page.dart' as _i1;
import 'package:app/ui/registration/reg_page.dart' as _i4;
import 'package:app/ui/scan/scan_page.dart' as _i6;
import 'package:app/ui/signIn/sign_in_page.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.SignInPage(),
          fullscreenDialog: true);
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.DetailPage(key: args.key, book: args.book));
    },
    RegRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i4.RegPage(),
          fullscreenDialog: true);
    },
    BooksRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.BooksPage());
    },
    ScanRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.ScanPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(HomeRoute.name, path: '/', children: [
          _i7.RouteConfig(BooksRoute.name,
              path: 'books', parent: HomeRoute.name),
          _i7.RouteConfig(ScanRoute.name,
              path: 'book_scan', parent: HomeRoute.name)
        ]),
        _i7.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i7.RouteConfig(DetailRoute.name, path: '/detail'),
        _i7.RouteConfig(RegRoute.name, path: '/reg')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/signIn');

  static const String name = 'SignInRoute';
}

/// generated route for [_i3.DetailPage]
class DetailRoute extends _i7.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i8.Key? key, required _i9.Book? book})
      : super(name,
            path: '/detail', args: DetailRouteArgs(key: key, book: book));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.book});

  final _i8.Key? key;

  final _i9.Book? book;
}

/// generated route for [_i4.RegPage]
class RegRoute extends _i7.PageRouteInfo<void> {
  const RegRoute() : super(name, path: '/reg');

  static const String name = 'RegRoute';
}

/// generated route for [_i5.BooksPage]
class BooksRoute extends _i7.PageRouteInfo<void> {
  const BooksRoute() : super(name, path: 'books');

  static const String name = 'BooksRoute';
}

/// generated route for [_i6.ScanPage]
class ScanRoute extends _i7.PageRouteInfo<void> {
  const ScanRoute() : super(name, path: 'book_scan');

  static const String name = 'ScanRoute';
}
