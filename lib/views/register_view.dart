import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const RegisterBody(),
    );
  }
}


