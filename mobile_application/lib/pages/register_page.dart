import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String? email;

  RegisterPage({this.email});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  bool termsError = false;
  bool validateTermsOnPress = false;

  bool _isTermsAccepted = false;
  bool _isNewsletterAccepted = false;

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      _emailController.text = widget.email!;
    }
  }

  void _register() {
    setState(() {
      emailError = '';
      passwordError = '';
      confirmPasswordError = '';
      termsError = false;
      validateTermsOnPress = true;

      if (_emailController.text.isEmpty) {
        emailError = 'Adres E-mail jest wymagany';
      }
      if (_passwordController.text.isEmpty) {
        passwordError = 'Hasło jest wymagane';
      }
      if (_confirmPasswordController.text.isEmpty) {
        confirmPasswordError = 'Potwierdzenie hasła jest wymagane';
      }
      if (_passwordController.text != _confirmPasswordController.text) {
        confirmPasswordError = 'Hasła nie pasują do siebie';
      }
      if (!_isTermsAccepted) {
        termsError = true;
      }
    });

    if (emailError.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty &&
        !termsError) {
      // Logika rejestracji
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Zarejestruj się',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Adres E-mail',
                    errorText: emailError.isNotEmpty ? emailError : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Hasło',
                    errorText: passwordError.isNotEmpty ? passwordError : null,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Wprowadź hasło ponownie',
                    errorText: confirmPasswordError.isNotEmpty
                        ? confirmPasswordError
                        : null,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: Text(
                    'Akceptuję regulamin i politykę prywatności. *',
                    style: TextStyle(
                      color: termsError && validateTermsOnPress
                          ? Colors.red
                          : null,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  value: _isTermsAccepted,
                  onChanged: (newValue) {
                    setState(() {
                      _isTermsAccepted = newValue!;
                      if (validateTermsOnPress) {
                        termsError = !newValue;
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.all(0),
                ),
                CheckboxListTile(
                  title: Text(
                    'Chcę otrzymywać e-mail newsletter – informacje o nowościach, promocjach, produktach lub usługach związanych z XXX – na zasadach opisanych w polityce prywatności.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                  value: _isNewsletterAccepted,
                  onChanged: (newValue) {
                    setState(() {
                      _isNewsletterAccepted = newValue!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.all(0),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '* - pole jest wymagane',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    child: Text('Zarejestruj się'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
