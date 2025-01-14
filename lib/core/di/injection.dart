import '../app_export.dart';


final sl = GetIt.instance;

Future<void> init() async {


  sl.registerFactory(
    () => ThemeBloc(
      ThemeState(
        themeType: PrefUtils().getThemeData(),
      ),
    ),
  );
  sl.registerFactory(
    () => AppCubit(
    
    ),
  );




  sl.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
