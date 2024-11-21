import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trouve_moi_mobile/apresentation/standart/app_colors.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late final FormFieldState<String>? _formFieldState;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(212, 203, 225, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.04,
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: Colors.black,
            size: 24,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              onChanged: (value) {
                final form = Form.of(context);
                if (form != null) {
                  form.validate();
                }
              },
              decoration: InputDecoration(
                hintText: widget.labelText,
                hintStyle: TextStyle(
                  color: AppColors.background,
                  fontFamily: GoogleFonts.arapey().fontFamily,
                ),
                errorStyle: const TextStyle(
                  height: 0.8,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.04,
                fontFamily: GoogleFonts.arapey().fontFamily,
              ),
              validator: widget.validator,
            ),
          ),
        ],
      ),
    );
  }
}
