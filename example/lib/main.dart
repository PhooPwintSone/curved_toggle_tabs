import 'package:curved_toggle_tabs/curved_toggle_tabs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Curve Toggle Tabs Example',
      theme: ThemeData.dark(),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Curve Toggle Tabs',
                style: TextStyle(
                  color: Color(0xFF06B6D4),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Smooth S-curve folder tab animation package',
                style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              ),
              const SizedBox(height: 32),

              // Your Package Widget in Action
              CurveToggleTabs(
                firstTabTitle: 'Log In',
                secondTabTitle: 'Sign Up',
                cardColor: const Color(0xFF1E293B),
                // Custom style for the selected tab
                activeTextStyle: const TextStyle(
                  color: Color(0xFF06B6D4), // Cyan highlight
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
                // Custom style for the unselected tab
                inactiveTextStyle: const TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                firstTabView: Column(
                  children: [
                    _buildDemoField(
                      'Email Address',
                      'user@example.com',
                      Icons.alternate_email,
                    ),
                    const SizedBox(height: 16),
                    _buildDemoField(
                      'Password',
                      '•••••••',
                      Icons.lock_outline,
                      isObscure: true,
                    ),
                  ],
                ),
                secondTabView: Column(
                  children: [
                    _buildDemoField(
                      'Username',
                      'john_doe',
                      Icons.person_outline,
                    ),
                    const SizedBox(height: 16),
                    _buildDemoField(
                      'Email Address',
                      'user@example.com',
                      Icons.alternate_email,
                    ),
                    const SizedBox(height: 16),
                    _buildDemoField(
                      'Password',
                      '•••••••',
                      Icons.lock_outline,
                      isObscure: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildDemoField(
    String label,
    String hint,
    IconData icon, {
    bool isObscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isObscure,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
            filled: true,
            fillColor: const Color(0xFF0F172A),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            suffixIcon: Icon(icon, color: const Color(0xFF8B5CF6), size: 18),
          ),
        ),
      ],
    );
  }
}
