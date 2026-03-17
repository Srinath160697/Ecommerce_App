import 'package:flutter/material.dart';
import 'package:frontend_ecommerce_app/controller/auth_controller.dart';
import 'package:frontend_ecommerce_app/view/screens/authentication/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();
  late String fullName;
  late String email;
  late String password;

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
                TextFormField(
                  onChanged: (value) {
                    fullName = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  // controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authController.signUpUsers(
                          context: context,
                          fullName: fullName,
                          email: email,
                          password: password,
                        );
                        print(fullName);
                        print(email);
                        print(password);
                      }
                    },
                    child: const Text("signup"),
                  ),
                ),
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to Register Screen
                        // Navigate to Register Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Login"),
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
