// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:app/data/model/book.dart' as _i8;
import 'package:app/ui/books/books_page.dart' as _i4;
import 'package:app/ui/detail/detail_page.dart' as _i3;
import 'package:app/ui/home/home_page.dart' as _i1;
import 'package:app/ui/signIn/sign_in_page.dart' as _i2;
import 'package:app/ui/video/video_page.dart' as _i5;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i2.SignInPage(),
          fullscreenDialog: true);
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.DetailPage(key: args.key, book: args.book));
    },
    BooksRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.BooksPage());
    },
    VideoRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.VideoPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomeRoute.name, path: '/', children: [
          _i6.RouteConfig(BooksRoute.name,
              path: 'books', parent: HomeRoute.name),
          _i6.RouteConfig(VideoRoute.name,
              path: 'video', parent: HomeRoute.name)
        ]),
        _i6.RouteConfig(SignInRoute.name, path: '/signIn'),
        _i6.RouteConfig(DetailRoute.name, path: '/detail')
      ];
}

/// generated route for [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [_i2.SignInPage]
class SignInRoute extends _i6.PageRouteInfo<void> {
  const SignInRoute() : super(name, path: '/signIn');

  static const String name = 'SignInRoute';
}

/// generated route for [_i3.DetailPage]
class DetailRoute extends _i6.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({_i7.Key? key, required _i8.Book? book})
      : super(name,
            path: '/detail', args: DetailRouteArgs(key: key, book: book));

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({this.key, required this.book});

  final _i7.Key? key;

  final _i8.Book? book;
}

/// generated route for [_i4.BooksPage]
class BooksRoute extends _i6.PageRouteInfo<void> {
  const BooksRoute() : super(name, path: 'books');

  static const String name = 'BooksRoute';
}

/// generated route for [_i5.VideoPage]
class VideoRoute extends _i6.PageRouteInfo<void> {
  const VideoRoute() : super(name, path: 'video');

  static const String name = 'VideoRoute';
}
