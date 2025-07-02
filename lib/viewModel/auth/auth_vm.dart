import 'package:app_crew/exports/exports.dart';
import 'package:app_crew/services/firebase_auth_helper.dart';
import 'package:app_crew/services/firestore_helper.dart';
import 'package:app_crew/view/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthVM extends ChangeNotifier {
  bool isPassVisible = false;
  bool isLoadingLogin = false;

  loginPageInit() {
    isPassVisible = false;
    isLoadingLogin = false;
    notifyListeners();
  }

  setIsPassVisible() {
    isPassVisible = !isPassVisible;
    notifyListeners();
  }

  onTapLogin(BuildContext context, {required String email, required String password}) async {
    isLoadingLogin = true;
    notifyListeners();

    try {
      final exists = await FirestoreService.emailExists(email);
      late UserCredential userCred;

      if (exists) {
        // 🔐 Login existing user
        userCred = await FirebaseAuthHelper.signIn(email, password);
        showSuccessToast(context, "Login successful");
      } else {
        // 🆕 Register new user
        userCred = await FirebaseAuthHelper.signUp(email, password);
        await FirestoreService.createUser(
          uid: userCred.user!.uid,
          email: email,
        );
        showSuccessToast(context, "Account created successfully");
      }

      navigatorKey.currentState?.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      showErrorToast(context, e.message ?? "Authentication error");
    } catch (e) {
      showErrorToast(context, "Something went wrong");
    } finally {
      isLoadingLogin = false;
      notifyListeners();
    }
  }
}
