
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/local/cache_helper.dart';
import 'package:graduation_project/views/login_view.dart';
import 'package:graduation_project/widgets/leave_app_snack_bar.dart';
import 'package:graduation_project/widgets/on_boarding_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            actions: [
              TextButton(
                onPressed: () {
                  CacheHelper.saveData(key: 'onBoarding', value: true).then((value){
                    if(value){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return const LoginView();
                      }));
                    }
                  });
                },
                child: const Text('SKIP'),
              ),
            ],
          ),
          body: DoubleBackToCloseApp(
            snackBar: closeAppSnackBar(),
            child: const OnBoardingBody(),
          ),
        );
  }
}
