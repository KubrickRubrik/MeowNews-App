import 'package:get_it/get_it.dart';
import 'package:news_test/data/api/core/server/api_server.dart';
import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/repository/news.dart';
import 'package:news_test/domain/repository/news.dart';
import 'package:news_test/domain/use_cases/news.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/session/provider.dart';

final locator = GetIt.I;

abstract final class ServicesLocator {
  static void setup() {
    // API
    locator.registerLazySingleton<ApiEnvelope>(() => ApiServer());
    // Repository
    locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(locator()));
    // Use Cases
    locator.registerLazySingleton<NewsCase>(() => NewsCase(locator()));
    // Manager
    locator.registerLazySingleton<SessionProvider>(() => SessionProvider());
    // Pages
    locator.registerLazySingleton<NewsProvider>(() => NewsProvider(locator()));
  }
}
