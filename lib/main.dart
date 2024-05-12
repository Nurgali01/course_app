import 'package:course_app/core/common/app/providers/user_provider.dart';
import 'package:course_app/core/services/router.dart';
import 'package:course_app/firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:course_app/core/res/fonts.dart';
import 'package:provider/provider.dart';
import 'core/res/colours.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/injection_container.dart';
import 'src/dashboard/presentation/providers/dashboard_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: ChangeNotifierProvider(
          create: (_) => UserProvider(),
        child: MaterialApp(
        title: 'Education App',
          theme: ThemeData(
            useMaterial3: true,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: Fonts.poppins,
            appBarTheme: const AppBarTheme(
              color: Colors.transparent,
            ),
            colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
        ),
          onGenerateRoute: generateRoute,
        )
      ),
    );
  }
}

