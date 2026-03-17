import 'package:flutter/material.dart';
import 'package:frontend_ecommerce_app/controller/auth_controller.dart';
import 'package:frontend_ecommerce_app/view/screens/authentication/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final AuthController _authController = AuthController();
  late String email;
  late String password;
  bool isLoading = false;

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authController
        .signInUsers(context: context, email: email, password: password)
        .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// Email TextField
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  // controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Enter Email",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                /// Password TextField
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  // controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        loginUser();
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.blue)
                        : const Text("Login"),
                  ),
                ),
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to Register Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text("Register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
