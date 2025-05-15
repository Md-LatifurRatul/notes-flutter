import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_flutter/controllers/obsecure_text_controller.dart';
import 'package:notes_flutter/controllers/sign_in_controller.dart';
import 'package:notes_flutter/models/auth_user.dart';
import 'package:notes_flutter/routes/app_routes.dart';
import 'package:notes_flutter/widgets/auth_bottom_section.dart';
import 'package:notes_flutter/widgets/custom_auth_button.dart';
import 'package:notes_flutter/widgets/snack_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final ObsecureTextController _obsecuredController =
      Get.find<ObsecureTextController>();

  Future<void> _signInAccount(SignInController signInController) async {
    final user = AuthUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final success = await signInController.signIn(user);
    if (success) {
      SnackMessage.shownackMessage(
        context: context,
        message: "Login Sucessful",
        type: SnackType.success,
      );
      if (mounted) {
        context.go(AppRoutes.home);
      }
    } else {
      SnackMessage.shownackMessage(
        context: context,
        message: signInController.errorMessage,
        type: SnackType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  "Login",
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Welcome to the Notes-Flutter App",
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),

                const SizedBox(height: 60),
                _buildEmailTextField(),

                const SizedBox(height: 20),
                _buildPasswordTextField(),
                const SizedBox(height: 20),
                GetBuilder<SignInController>(
                  builder: (signInController) {
                    return signInController.inProgress
                        ? const Center(child: CircularProgressIndicator())
                        : CustomAuthButton(
                          buttonName: "Login",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _signInAccount(signInController);
                            }
                          },
                        );
                  },
                ),

                const SizedBox(height: 16),
                AuthBottomSection(
                  labelText: "Don't have an account?",
                  authText: "Sign up",
                  onPressed: () {
                    context.push(AppRoutes.signup);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Obx(
      () => TextFormField(
        controller: _passwordController,
        obscureText: _obsecuredController.isObsecured.value,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              _obsecuredController.toogleObsecure();
            },
            icon: _obsecuredController.icon,
          ),
          labelText: 'Password',
          hintText: "Enter your password",
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
        ),

        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: "Enter your email",
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(),
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Please enter your email";
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
