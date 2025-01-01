import 'package:day_3/login.dart';
import 'package:day_3/services/firebaseauthservice.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
   Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final FocusNode usernameFocusNode = FocusNode();
    final FocusNode emailFocusNode = FocusNode();
    final FocusNode passwordFocusNode = FocusNode();
    final FocusNode confirmPasswordFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color.fromARGB(255, 127, 32, 156),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Sign up',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const Text('Create your account'),
            const SizedBox(height: 20),
            // Username Field
            TextField(
              focusNode: usernameFocusNode,
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: const Icon(Icons.person),
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 212, 240),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Email Field
            TextField(
              focusNode: emailFocusNode,
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 212, 240),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Password Field
            TextField(
              focusNode: passwordFocusNode,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 212, 240),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Confirm Password Field
            TextField(
              focusNode: confirmPasswordFocusNode,
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: const Color.fromARGB(255, 241, 212, 240),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sign Up Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 40),
                backgroundColor: const Color.fromARGB(255, 127, 32, 156),
              ),
              onPressed: () async{
                setState(() {
                  isLoading = true;
                });
                await signup(
                    username: usernameController.text,
                    email: emailController.text,
                    password: passwordController.text,context: context);
                // Add Sign-Up Logic Here
                setState(() {
                  isLoading = false;
                });
              },
              child: isLoading?CircularProgressIndicator(): Text('Sign Up'),
            ),
            const SizedBox(height: 15),
            // Already have an account
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: const Text(
                'Already have an account? Login',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
