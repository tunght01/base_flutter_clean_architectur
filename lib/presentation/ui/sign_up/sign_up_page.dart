import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(body: Column());
  }
}
