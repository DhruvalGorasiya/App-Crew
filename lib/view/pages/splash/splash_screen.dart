import 'package:app_crew/services/firebase_auth_helper.dart';
import 'package:app_crew/view/pages/auth/login_page.dart';
import 'package:app_crew/view/pages/home/home_page.dart';

import '../../../exports/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getRoute();
  }

  getRoute() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => FirebaseAuthHelper.currentUser == null ? LoginPage() : HomePage()),
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Image.asset(
            AppImages.splashIcon,
            width: 300,
          ),
        ),
      ),
    );
  }
}
