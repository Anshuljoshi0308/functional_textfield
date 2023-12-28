import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FunTextField extends StatelessWidget {
  FunTextField({
    super.key,
    required this.controller,
    required this.lable,
    required this.hint,
    this.prefixText="",
    this.onChanged,
    this.validator,
    this.tkey,
    this.maxLines = 2,
    this.minLines = 1,
    this.enable = true,
    this.icon,
    this.forRow = false,
    this.keybordType = TextInputType.text,
    this.innertextAling = TextAlign.start,
    this.textfieldAction = TextInputAction.next,
    this.forPhoneNo = false,
    this.forEmail = false,
    this.notNull = false,
    this.onlyNo = false,
    this.autofocus = false,
    this.passwordfield = false,
    this.outlineColor = Colors.lightBlue,
    this.outlinOnFocus = Colors.lightBlue,
    this.fillColor = true,
    this.fillColorValue = Colors.white,
    this.textColor = Colors.black,
  });

 final TextEditingController controller;
  final String lable;
  final String hint;
  final String? prefixText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final dynamic   tkey;
  final   int minLines;
  final int maxLines;
  final bool enable;
  final dynamic icon;
  final bool forRow ;
  final TextInputType keybordType;
  final TextAlign innertextAling;
  final TextInputAction textfieldAction;
  final bool forPhoneNo;
  final bool forEmail;
  final bool notNull;
  final bool onlyNo;
  final bool autofocus;
  final bool passwordfield;
  final dynamic outlineColor;
  final dynamic outlinOnFocus;
  final bool fillColor;
  final dynamic fillColorValue;
  final Color textColor;

  /// validation  variable define
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  final anyValueRegex = RegExp(r'^.*$');
  final phoneRegex = RegExp(r'[0-9]');

  /// validation phone number and only number value
  inputFormate() {
    if (forPhoneNo == true || onlyNo) {
      return phoneRegex;
    } else {
      return anyValueRegex;
    }
  }

  /// validation for the email and phone
  keyBoardinputFormate() {
    if (forPhoneNo == true || onlyNo == true) {
      return TextInputType.phone;
    } else if (forEmail == true) {
      return TextInputType.emailAddress;
    } else {
      return keybordType;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(7, 7, 9, 7),
        child: TextFormField(
          spellCheckConfiguration: const SpellCheckConfiguration(),
          key: tkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          enabled: enable,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(inputFormate())
          ],
          controller: controller,
          textInputAction: textfieldAction,
          autofocus: autofocus,
          obscureText: passwordfield,
          onChanged: onChanged,
          validator: (value) {
            if (forPhoneNo && (value == null || value.isEmpty)) {
              return 'Phone number is required';
            } else if (forPhoneNo && value != null && value.length != 10) {
              return 'Phone number must have exactly 10 digits';
            } else if (forEmail && (value == null || value.isEmpty)) {
              return 'Email is required';
            } else if (forEmail && (!emailRegex.hasMatch(value!))) {
              return 'Invalid email format';
            } else if (notNull == true && value!.isEmpty) {
              return "Value Can't be Empty";
            } else if (onlyNo == true && value!.isEmpty) {
              return "Value Can't be Empty";
            }
            return null;
          },
          // expands: true;
          minLines: minLines,
          maxLines: maxLines,

          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            labelText: lable,
            hintText: hint,
            prefixText: prefixText == null ? "" : prefixText.toString(),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: outlineColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(18)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: outlineColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: outlineColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFEF1212),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFEF1212),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            filled: fillColor,
            fillColor: fillColorValue,
            prefixIcon: Icon(icon),
          ),
          textAlign: innertextAling,
          keyboardType: keyBoardinputFormate(),
        ),
      ),
    );
  }
}

