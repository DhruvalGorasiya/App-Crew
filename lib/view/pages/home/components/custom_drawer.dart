import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/services/firebase_auth_helper.dart';
import 'package:app_crew/utils/shared_pref_helper.dart';
import 'package:app_crew/view/pages/auth/login_page.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  void logout() async {
    await FirebaseAuthHelper.signOut();
    await SharedPrefHelper.deleteAll();
    navigatorKey.currentState
        ?.pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const LoginPage()), (route) => false);
    showInfoToast(context, "Logged out successfully");
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(text: "Logged in as:", style: styleBody16Medium),
                h(8),
                customText(
                  text: FirebaseAuthHelper.currentUser?.email ?? "",
                  style: styleSubtitle18SemiBold,
                ),
                h(8),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: customText(text: "Logout"),
            onTap: logout,
          ),
        ],
      ),
    );
  }
}
