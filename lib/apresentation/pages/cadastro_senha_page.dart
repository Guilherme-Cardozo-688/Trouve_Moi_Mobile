import 'package:flutter/material.dart';
import 'package:trouve_moi_mobile/apresentation/standart/custom_input_field.dart';

class CadastroSenha extends StatefulWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController;
  final TextEditingController telefoneController;
  final TextEditingController emailController;
  final TextEditingController dataNascimentoController;
  final TextEditingController cpfController;
  final TextEditingController enderecoController;

  CadastroSenha({
    Key? key,
    required this.nomeController,
    required this.telefoneController,
    required this.emailController,
    required this.dataNascimentoController,
    required this.cpfController,
    required this.enderecoController,
  }) : super(key: key);

  @override
  State<CadastroSenha> createState() => _CadastroSenhaState();
}

class _CadastroSenhaState extends State<CadastroSenha> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmaSenhaController =
      TextEditingController();
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: MediaQuery.of(context).size.width / 40,
              right: MediaQuery.of(context).size.width / 40,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.65,
                width: MediaQuery.of(context).size.height / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(85, 105, 94, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: widget._formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.11),
                    const Center(
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: 70,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    CustomInputField(
                      labelText: 'UserName',
                      icon: Icons.account_circle,
                      controller: _userNameController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    CustomInputField(
                      labelText: 'Senha',
                      icon: _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      controller: _senhaController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma senha.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomInputField(
                      labelText: 'Confirme sua senha',
                      icon: _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      controller: _confirmaSenhaController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma senha.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    ValueListenableBuilder<String?>(
                      valueListenable: _errorNotifier,
                      builder: (context, errorMessage, child) {
                        if (errorMessage == null) {
                          return const SizedBox.shrink();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            errorMessage,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    ElevatedButton(
                      onPressed: () {
                        if (_userNameController.text.isEmpty) {
                          _errorNotifier.value =
                              'Por favor, insira seu nome de usuário.';
                        } else if (_senhaController.text.isEmpty) {
                          _errorNotifier.value = 'Por favor, insira sua senha.';
                        } else if (_confirmaSenhaController.text.isEmpty) {
                          _errorNotifier.value =
                              'Por favor, confirme sua senha.';
                        } else if (_senhaController.text !=
                            _confirmaSenhaController.text) {
                          _errorNotifier.value =
                              'As senhas precisam ser idênticas.';
                        } else {
                          _errorNotifier.value = null;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cadastro realizado com sucesso!'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(85, 105, 94, 1),
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
