import 'dart:async';

import 'package:logging/logging.dart';
import '../../data_sources/specializations/specializations_remote_data_source.dart';
import '../../models/specialization/specialization.dart';
import '/core/exceptions/cache_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/repository_exception.dart';
import '/core/services/connectivity/connectivity_service.dart';
import '/locator.dart';

abstract class SpecializationsRepository {
  Future<Specialization> fetchSpecialization(
      [Map<String, dynamic>? parameters]);
  //Future<Review> sendReview([Map<String, dynamic>? parameters]);

  Future<List<Specialization>> fetchSpecializationsList(
      [Map<String, dynamic>? parameters]);

  //Future<Genre> fetchGenre([Map<String, dynamic>? parameters]);

  //Future<List<Genre>> fetchGenresList([Map<String, dynamic>? parameters]);
}

class SpecializationsRepositoryImpl implements SpecializationsRepository {
  final SpecializationsRemoteDataSource? remoteDataSource =
      locator<SpecializationsRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('SpecializationsRepositoryImpl');
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
  Future<Specialization> fetchSpecialization(
      [Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchSpecialization(parameters);

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
  Future<List<Specialization>> fetchSpecializationsList(
      [Map<String, dynamic>? parameters]) async {
    try {
      final items =
          await remoteDataSource!.fetchSpecializationsList(parameters);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch Specialization remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch Specialization locally');
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
