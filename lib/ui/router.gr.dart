// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../core/models/post/post.dart' as _i7;
import 'views/home_page/home_page.dart' as _i2;
import 'views/posts_view/posts_view.dart' as _i3;
import 'views/settings/settings_view.dart' as _i4;
import 'views/startup/start_up_view.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartUpViewRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.StartUpView());
    },
    HomePageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.HomePage());
    },
    PostsViewRoute.name: (routeData) {
      final args = routeData.argsAs<PostsViewRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PostsView(args.post));
    },
    SettingsViewRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.SettingsView());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(StartUpViewRoute.name, path: '/'),
        _i5.RouteConfig(HomePageRoute.name, path: '/home-page'),
        _i5.RouteConfig(PostsViewRoute.name, path: '/posts-view'),
        _i5.RouteConfig(SettingsViewRoute.name, path: '/settings-view')
      ];
}

/// generated route for
/// [_i1.StartUpView]
class StartUpViewRoute extends _i5.PageRouteInfo<void> {
  const StartUpViewRoute() : super(StartUpViewRoute.name, path: '/');

  static const String name = 'StartUpViewRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomePageRoute extends _i5.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/home-page');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i3.PostsView]
class PostsViewRoute extends _i5.PageRouteInfo<PostsViewRouteArgs> {
  PostsViewRoute({required _i7.Post post})
      : super(PostsViewRoute.name,
            path: '/posts-view', args: PostsViewRouteArgs(post: post));

  static const String name = 'PostsViewRoute';
}

class PostsViewRouteArgs {
  const PostsViewRouteArgs({required this.post});

  final _i7.Post post;

  @override
  String toString() {
    return 'PostsViewRouteArgs{post: $post}';
  }
}

/// generated route for
/// [_i4.SettingsView]
class SettingsViewRoute extends _i5.PageRouteInfo<void> {
  const SettingsViewRoute()
      : super(SettingsViewRoute.name, path: '/settings-view');

  static const String name = 'SettingsViewRoute';
}
