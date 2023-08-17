import 'package:get_it/get_it.dart';
import 'package:news_test/data/api/core/server/api_server.dart';
import 'package:news_test/data/api/interfaces/api.dart';
import 'package:news_test/data/repository/item_news.dart';
import 'package:news_test/data/repository/news.dart';
import 'package:news_test/domain/repository/item_news.dart';
import 'package:news_test/domain/repository/news.dart';
import 'package:news_test/domain/use_cases/item_news.dart';
import 'package:news_test/domain/use_cases/news.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:news_test/presentation/manager/session/provider.dart';

final locator = GetIt.I;

/// A service locator is used to keep all `DI` in one place.
abstract final class ServicesLocator {
  static void setup() {
    //? API
    locator.registerLazySingleton<ApiEnvelope>(() => ApiServer());
    //? Repository
    locator.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(locator()));
    locator.registerLazySingleton<ItemNewsRepository>(() => ItemNewsRepositoryImpl(locator()));
    //? Use Cases
    locator.registerLazySingleton<NewsCase>(() => NewsCase(locator()));
    locator.registerLazySingleton<ItemNewsCase>(() => ItemNewsCase(locator()));
    //? Session manager
    locator.registerLazySingleton<SessionProvider>(() => SessionProvider());
    //? Pages manager
    locator.registerLazySingleton<NewsProvider>(() => NewsProvider(locator()));
    locator.registerLazySingleton<ItemNewsProvider>(() => ItemNewsProvider(locator()));
  }
}
