import 'package:book_reservation_app/features/auth/register/presentation/view/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterViewBody(),
    );
  }
}
