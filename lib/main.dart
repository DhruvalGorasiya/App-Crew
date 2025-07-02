import 'package:app_crew/exports/main_export.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefHelper.initialize();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthVM>(create: (context) => AuthVM()),
        ChangeNotifierProvider<HomeVM>(create: (context) => HomeVM()),
      ],
      child: GestureDetector(
        onTap: () => hideKeyboard(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          navigatorKey: navigatorKey,
          theme: lightTheme(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
