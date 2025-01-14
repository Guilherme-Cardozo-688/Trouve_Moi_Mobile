import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trouve_moi_mobile/apresentation/pages/cadastro_senha_page.dart';
import 'package:trouve_moi_mobile/apresentation/standart/Input_mask_formatters%20.dart';
import 'package:trouve_moi_mobile/apresentation/standart/custom_input_field.dart';

class CadastroPessoa extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();

  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  CadastroPessoa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.4,
                left: MediaQuery.of(context).size.width / 5,
              ),
              child: SvgPicture.asset(
                'assets/images/QUADRADO-ALEATORIO.svg',
                height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0,
                right: MediaQuery.of(context).size.width / 5,
              ),
              child: Transform.rotate(
                angle: 90 * (3.141592653589793 / 180),
                child: SvgPicture.asset(
                  'assets/images/QUADRADO-ALEATORIO.svg',
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: MediaQuery.of(context).size.width / 40,
              right: MediaQuery.of(context).size.width / 40,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                width: MediaQuery.of(context).size.height / 2.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xFF607A6B),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 1.5,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/BACK-BUTTON.svg',
                  height: MediaQuery.of(context).size.height / 7,
                  fit: BoxFit.fill,
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
                      inputFormatters: [InputMaskFormatters.data],
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
                      inputFormatters: [InputMaskFormatters.telefone],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'CPF',
                      icon: Icons.assignment_ind,
                      controller: _cpfController,
                      inputFormatters: [InputMaskFormatters.cpf],
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.017),
                    CustomInputField(
                      labelText: 'Endereço',
                      icon: Icons.house_rounded,
                      controller: _enderecoController,
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
                    SizedBox(height: 80),
                    Align(
                      alignment: Alignment.center,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 200,
                          minHeight: 70,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_nomeController.text.isEmpty) {
                              _errorNotifier.value =
                                  'Por favor, insira seu nome completo.';
                            } else if (_dataNascimentoController.text.isEmpty) {
                              _errorNotifier.value =
                                  'Por favor, insira sua data de nascimento.';
                            } else if (_emailController.text.isEmpty) {
                              _errorNotifier.value =
                                  'Por favor, insira seu email.';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_emailController.text)) {
                              _errorNotifier.value =
                                  'Por favor, insira um email válido.';
                            } else if (_telefoneController.text.isEmpty) {
                              _errorNotifier.value =
                                  'Por favor, insira seu telefone.';
                            } else if (_cpfController.text.isEmpty ||
                                _cpfController.text.length != 14) {
                              _errorNotifier.value =
                                  'Por favor, insira um CPF válido com 11 dígitos.';
                            } else if (_enderecoController.text.isEmpty) {
                              _errorNotifier.value =
                                  'Por favor, insira seu endereço.';
                            } else {
                              _errorNotifier.value = null;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CadastroSenha(
                                    nomeController: _nomeController,
                                    dataNascimentoController:
                                        _dataNascimentoController,
                                    emailController: _emailController,
                                    telefoneController: _telefoneController,
                                    cpfController: _cpfController,
                                    enderecoController: _enderecoController,
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(85, 105, 94, 1),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Next',
                            style: GoogleFonts.tinos(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
