import 'package:flutter/material.dart';

import 'core/app_export.dart';
import 'core/constants/bloc_observer.dart';
import 'core/di/injection.dart' as di;
import 'core/errors/error_widget.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return DefaultErrorWidget();
  };
  await di.init();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    Bloc.observer = MyBlocObserver();

    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (BuildContext _) => di.sl<AppCubit>()),
            BlocProvider(create: (BuildContext _) => di.sl<ThemeBloc>()),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      dismissKeyBoard();
                    },
                    child: MaterialApp(
                      theme: AppTheme.darkTheme,
                      builder: BotToastInit(),
                      title: 'Vocabulary',
                      navigatorKey: navigatorKey,
                      debugShowCheckedModeBanner: false,
                      initialRoute: AppRoutes.initialRoute,
                      routes: AppRoutes.routes,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
