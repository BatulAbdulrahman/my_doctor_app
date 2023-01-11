import 'dart:async';

import 'package:movieapp/core/services/connectivity/connectivity_service.dart';
import 'package:movieapp/core/services/connectivity/connectivity_service_impl.dart';
import 'package:movieapp/core/services/http/http_service.dart';
import 'package:movieapp/core/services/http/http_service_impl.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service_impl.dart';
import 'package:movieapp/core/services/navigation/navigation_service.dart';
import 'package:movieapp/core/services/navigation/navigation_service_impl.dart';
import 'package:movieapp/core/utils/file_helper.dart';
import 'package:get_it/get_it.dart';

import 'core/data_sources/posts/post_remote_data_source.dart';
import 'core/repositories/posts_repository/posts_repository.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.

Future<void> setupLocator() async {
  // Services

  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );

  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );

  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  // Data sources

  locator.registerLazySingleton<PostsRemoteDataSource>(
    () => PostsRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl());

  await _setupSharedPreferences();

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance!);
}
