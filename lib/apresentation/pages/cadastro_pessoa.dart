import 'package:flutter/material.dart';
import 'package:trouve_moi_mobile/apresentation/standart/custom_input_field.dart';

class CadastroPessoa extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _houseController = TextEditingController();

  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  CadastroPessoa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background
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
                key: _formKey,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    CustomInputField(
                      labelText: 'Nome Completo',
                      icon: Icons.badge,
                      controller: _nomeController,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'Data de Nascimento',
                      icon: Icons.calendar_today,
                      controller: _dataNascimentoController,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'Email',
                      icon: Icons.email,
                      controller: _emailController,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'Telefone',
                      icon: Icons.phone,
                      controller: _telefoneController,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'CPF',
                      icon: Icons.assignment_ind,
                      controller: _cpfController,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'Endereço',
                      icon: Icons.house_rounded,
                      controller: _houseController,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ValueListenableBuilder<String?>(
                      valueListenable: _errorNotifier,
                      builder: (context, errorMessage, child) {
                        if (errorMessage == null) return SizedBox.shrink();
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
                    SizedBox(height: 120),
                    ElevatedButton(
                      onPressed: () {
                        if (_nomeController.text.isEmpty) {
                          _errorNotifier.value =
                              'Por favor, insira seu nome completo.';
                        } else if (_dataNascimentoController.text.isEmpty) {
                          _errorNotifier.value =
                              'Por favor, insira sua data de nascimento.';
                        } else if (_emailController.text.isEmpty) {
                          _errorNotifier.value = 'Por favor, insira seu email.';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                          _errorNotifier.value =
                              'Por favor, insira um email válido.';
                        } else if (_telefoneController.text.isEmpty) {
                          _errorNotifier.value =
                              'Por favor, insira seu telefone.';
                        } else if (_cpfController.text.isEmpty ||
                            _cpfController.text.length != 11) {
                          _errorNotifier.value =
                              'Por favor, insira um CPF válido com 11 dígitos.';
                        } else if (_houseController.text.isEmpty) {
                          _errorNotifier.value =
                              'Por favor, insira seu endereço.';
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
