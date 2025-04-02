import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/presentation/router/router.dart';
import 'package:flutter_clean_architecture/shared/utils/bloc_observer.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'app.dart';
import 'di/di.dart';

Future main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = AppBlocObserver();
    EasyLocalization.logger.enableLevels = [
      LevelMessages.error,
      LevelMessages.warning,
    ];
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    await configureDependencies();
    getIt.registerSingleton(AppRouter());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await EasyLocalization.ensureInitialized();
    _startApp();
  }, (error, stackTrace) {
    logger.e('$error $stackTrace');
  });
}

Future _startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
      //child:  testFireBaseApp(),

    ),
  );
}

class testFireBaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Test',
      home: Scaffold(
        appBar: AppBar(title: Text('Firebase Test')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Test Firebase Firestore
              FirebaseFirestore.instance.collection('users').doc('user1').get().then((doc) {
                if (doc.exists) {
                  print('Tài liệu tồn tại: ${doc.data()}');
                } else {
                  print('Không tìm thấy tài liệu!');
                }
              });
            },
            child: Text('Test Firebase'),
          ),
        ),
      ),
    );
  }
}