import 'package:flutter/material.dart';

class RegisterationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegisterationScreenState();
  }
}

class _RegisterationScreenState extends State<RegisterationScreen> {

  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmError;

  bool obscure = true;
  bool agreed = false;

  @override
  void dispose() {
    nameCtrl.dispose();
    passwordCtrl.dispose();
    emailCtrl.dispose();
    confirmPassCtrl.dispose();
    super.dispose();
  }

  Widget segment(bool filled) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: filled ? const Color(0xFF1E7566) : const Color(0xFFD6DDD6),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const teal = Color(0xFF1E7566);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(24, 30, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 15),
                    onPressed: () => Navigator.pop(context),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(width: 1, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Create your account',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Takes under a minute. We only ask for what the app needs.',
                  style: TextStyle(fontSize: 15, color: Color(0xFF4F5F57)),
                ),
                const SizedBox(height: 28),
                TextField(
                  controller: nameCtrl,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Full name",
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: "Mehak Anwar",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 6
                      )
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD6DDD6)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: "you@email.com",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD6DDD6)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordCtrl,
                  obscureText: obscure,
                  textInputAction: TextInputAction.next,
                  onChanged: (_) => setState(() => passwordError = null),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'At least 8 characters',
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD6DDD6)),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Add a number or symbol to make it stronger",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF4F5F57),
                  ),
                ),

                const SizedBox(height: 16),
                TextField(
                  controller: confirmPassCtrl,
                  obscureText: obscure,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintText: "Repeat Password",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFD6DDD6)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFD6DDD6)),
                  ),
                  child: CheckboxListTile(
                    value: agreed,
                    onChanged: (_) => setState(() => agreed = !agreed),
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    title: const Text(
                      'I understand CampusMind stores my answers and scores to show my history, '
                      'and that results are a self-assessment, not a diagnosis.',
                      style: TextStyle(fontSize: 13, height: 1.4),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Log in',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
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
