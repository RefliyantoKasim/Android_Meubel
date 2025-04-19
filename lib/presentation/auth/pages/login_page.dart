import 'package:meubel/core/assets/assets.gen.dart';
import 'package:meubel/presentation/auth/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:meubel/data/services/auth_service.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../home/pages/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = usernameController.text.trim();
    final password = passwordController.text.trim();

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan password tidak boleh kosong')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final response = await AuthService().login(
        email: email,
        password: password,
      );

      print('Login berhasil: $response');

      // TODO: Simpan token jika perlu

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Akun Anda Tidak Terdaftar')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(80.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130.0),
            child: Image.asset(
              Assets.images.logo.path,
              width: 100,
              height: 100,
            ),
          ),
          const SpaceHeight(24.0),
          const Center(
            child: Text(
              "Meubel 2N",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          const SpaceHeight(8.0),
          const Center(
            child: Text(
              "Masuk untuk pengguna",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: usernameController,
            label: 'Email',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () {
              if (_isLoading) return;
              _handleLogin();
            },
            label: _isLoading ? 'Loading...' : 'Masuk',
            color: const Color.fromARGB(255, 32, 167, 133),
          ),
          const SpaceHeight(12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Belum punya akun? ",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
