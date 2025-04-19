import 'package:flutter/material.dart';
import 'package:meubel/data/services/auth_service.dart';
import 'package:meubel/core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../home/pages/dashboard_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SpaceHeight(60.0),
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
              "Daftar untuk akun baru",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          const SpaceHeight(40.0),
          CustomTextField(
            controller: nameController,
            label: 'Nama',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: emailController,
            label: 'Email',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: phoneController,
            label: 'No Telpon',
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: passwordController,
            label: 'Password',
            obscureText: true,
          ),
          const SpaceHeight(12.0),
          CustomTextField(
            controller: confirmPasswordController,
            label: 'Konfirmasi Password',
            obscureText: true,
          ),
          const SpaceHeight(24.0),
          Button.filled(
            onPressed: () async {
              final name = nameController.text.trim();
              final email = emailController.text.trim();
              final phone = phoneController.text.trim();
              final password = passwordController.text;
              final confirmPassword = confirmPasswordController.text;

              if (name.isEmpty ||
                  email.isEmpty ||
                  phone.isEmpty ||
                  password.isEmpty ||
                  confirmPassword.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Semua field tidak boleh kosong')),
                );
                return;
              }

              if (password != confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content:
                          Text('Password dan konfirmasi password harus sama')),
                );
                return;
              }

              try {
                final response = await AuthService().register(
                  name: name,
                  email: email,
                  password: password,
                  phone: phone,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registrasi berhasil!')),
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Terjadi kesalahan: $e')),
                );
              }
            },
            label: 'Daftar',
            color: const Color.fromARGB(255, 32, 167, 133),
          ),
          const SpaceHeight(16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sudah punya akun? ",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Masuk",
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
