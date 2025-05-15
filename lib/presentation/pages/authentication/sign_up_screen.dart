import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_flutter/controllers/obsecure_text_controller.dart';
import 'package:notes_flutter/controllers/sign_up_controller.dart';
import 'package:notes_flutter/models/auth_user.dart';
import 'package:notes_flutter/routes/app_routes.dart';
import 'package:notes_flutter/widgets/auth_bottom_section.dart';
import 'package:notes_flutter/widgets/custom_auth_button.dart';
import 'package:notes_flutter/widgets/snack_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ObsecureTextController _obsecuredController =
      Get.find<ObsecureTextController>();

  Future<void> _signUpAccount(SignUpController signUpController) async {
    final user = AuthUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final success = await signUpController.singUp(user);
    if (success) {
      SnackMessage.shownackMessage(
        message: "Account created! Please login",
        type: SnackType.success,
      );
      _emailController.clear();
      _nameController.clear();
      _passwordController.clear();
      if (mounted) {
        context.push(AppRoutes.login);
      }
    } else {
      SnackMessage.shownackMessage(
        message: signUpController.errorMessage,
        type: SnackType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create your account",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 50),

                _buildNameTextField(),
                const SizedBox(height: 20),

                _buildEmailTextField(),
                const SizedBox(height: 20),

                _buildPasswordTextField(),
                const SizedBox(height: 30),

                GetBuilder<SignUpController>(
                  builder: (signUpController) {
                    return signUpController.inProgress
                        ? const Center(child: CircularProgressIndicator())
                        : CustomAuthButton(
                          buttonName: "SignUp",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _signUpAccount(signUpController);
                            }
                          },
                        );
                  },
                ),

                const SizedBox(height: 20),

                AuthBottomSection(
                  labelText: "Already have an account?",
                  authText: "Login",
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
          labelText: "Password",
          border: OutlineInputBorder(),
        ),
        validator:
            (value) =>
                value == null || value.length < 6
                    ? "Enter at least 6 characters"
                    : null,
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: "Enter your email",
        hintStyle: TextStyle(color: Colors.grey),
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
      validator:
          (value) => value == null || value.isEmpty ? "Enter email" : null,
    );
  }

  Widget _buildNameTextField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        hintText: "Enter your name",
        hintStyle: TextStyle(color: Colors.grey),
        labelText: "Name",
        border: OutlineInputBorder(),
      ),
      validator:
          (value) => value == null || value.isEmpty ? "Enter name" : null,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
