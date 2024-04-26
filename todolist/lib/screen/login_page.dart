import 'package:flutter/material.dart';
import 'package:todolist/screen/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyAppState();
}

class _MyAppState extends State<LoginPage> with SingleTickerProviderStateMixin {
  bool isloading = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'To Do App',
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 40, color: Colors.blue),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email ID or Mobile Number',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isloading = true;
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    child: isloading
                        ? const CircularProgressIndicator()
                        : const Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ],
              ),
            )

            //
          ],
        ),
      ),
    );
  }
}
