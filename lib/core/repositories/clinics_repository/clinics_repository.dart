import 'dart:async';

import 'package:logging/logging.dart';
import '../../data_sources/clinics/clinics_remote_data_source.dart';
import '../../data_sources/specializations/specializations_remote_data_source.dart';
import '../../models/clinic/clinic.dart';
import '../../models/specialization/specialization.dart';
import '/core/exceptions/cache_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/repository_exception.dart';
import '/core/services/connectivity/connectivity_service.dart';
import '/locator.dart';

abstract class ClinicsRepository {
  Future<Clinic> fetchClinic([Map<String, dynamic>? parameters]);
  //Future<Review> sendReview([Map<String, dynamic>? parameters]);

  Future<List<Clinic>> fetchClinicsList([Map<String, dynamic>? parameters]);

  //Future<Genre> fetchGenre([Map<String, dynamic>? parameters]);

  //Future<List<Genre>> fetchGenresList([Map<String, dynamic>? parameters]);
}

class ClinicsRepositoryImpl implements ClinicsRepository {
  final ClinicsRemoteDataSource? remoteDataSource =
      locator<ClinicsRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('ClinicsRepositoryImpl');
  /*@override
  Future<Review> sendReview([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.sendReview(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }*/

  @override
  Future<Clinic> fetchClinic([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchClinic(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }

  @override
  Future<List<Clinic>> fetchClinicsList(
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchClinicsList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch Clinic remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch Clinic locally');
      throw RepositoryException(e.message);
    }
  }

  /*@override
  Future<Genre> fetchGenre([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchGenre(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }*/

  /*@override
  Future<List<Genre>> fetchGenresList(
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchGenresList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch posts remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch posts locally');
      throw RepositoryException(e.message);
    }
  }*/
}
