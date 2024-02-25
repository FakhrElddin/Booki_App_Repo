
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/leave_app_snack_bar.dart';
import 'package:graduation_project/widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: DoubleBackToCloseApp(
        snackBar: closeAppSnackBar(),
        child: const LoginBody(),
      ),
    );
  }
}




// PopScope(
// canPop: false,
// onPopInvoked: (didPop){
// if(didPop){
// return;
// }
// showAwesomeDialog(
// context,
// dialogType: DialogType.warning,
// title: 'Exit Confirmation',
// body: 'Are you sure you want to exit the app?',
// cancelOnPress: (){},
// okOnPress: (){
// SystemChannels.platform.invokeMethod('SystemNavigator.pop');
// },
// );
// },
// child: Scaffold

