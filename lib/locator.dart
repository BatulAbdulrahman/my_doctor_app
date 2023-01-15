import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:movieapp/core/utils/file_helper.dart';

import 'core/data_sources/clinics/clinics_remote_data_source.dart';
import 'core/data_sources/doctors/doctors_remote_data_source.dart';
import 'core/data_sources/specializations/specializations_remote_data_source.dart';
import 'core/repositories/clinics_repository/clinics_repository.dart';
import 'core/repositories/doctors_repository/doctors_repository.dart';
import 'core/repositories/specializations_repository/specializations_repository.dart';
import 'core/services/connectivity/connectivity_service.dart';
import 'core/services/connectivity/connectivity_service_impl.dart';
import 'core/services/http/http_service.dart';
import 'core/services/http/http_service_impl.dart';
import 'core/services/key_storage/key_storage_service.dart';
import 'core/services/key_storage/key_storage_service_impl.dart';
import 'core/services/navigation/navigation_service.dart';
import 'core/services/navigation/navigation_service_impl.dart';

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

  locator.registerLazySingleton<DoctorsRemoteDataSource>(
    () => DoctorsRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<SpecializationsRemoteDataSource>(
    () => SpecializationsRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<ClinicsRemoteDataSource>(
    () => ClinicsRemoteDataSourceImpl(),
  );

  locator
      .registerLazySingleton<DoctorsRepository>(() => DoctorsRepositoryImpl());

  locator.registerLazySingleton<SpecializationsRepository>(
      () => SpecializationsRepositoryImpl());

  locator
      .registerLazySingleton<ClinicsRepository>(() => ClinicsRepositoryImpl());

  await _setupSharedPreferences();

  // Utils   Specialization
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance!);
}
