import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_flutter/controllers/obsecure_text_controller.dart';
import 'package:notes_flutter/widgets/auth_bottom_section.dart';
import 'package:notes_flutter/widgets/custom_auth_button.dart';

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
  final ObsecureTextController obsecuredController =
      Get.find<ObsecureTextController>();
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

                CustomAuthButton(
                  buttonName: "SignUp",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),

                const SizedBox(height: 20),

                AuthBottomSection(
                  labelText: "Already have an account?",
                  authText: "Login",
                  onPressed: () {
                    context.push("/login");
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
        obscureText: obsecuredController.isObsecured.value,

        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              obsecuredController.toogleObsecure();
            },
            icon: obsecuredController.icon,
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
