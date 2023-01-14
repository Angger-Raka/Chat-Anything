import 'package:chat_anything/screen/sign%20up/sign_up_screen.dart';
import 'package:get/get.dart';

import '../screen/sign in/sign_in_screen.dart';

final List<GetPage> getPages = [
  GetPage(
    name: SignInScreen.routeName,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => const SignUpScreen(),
  ),
];
