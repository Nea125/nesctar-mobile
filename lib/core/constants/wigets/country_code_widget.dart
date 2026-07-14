import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class CountryPickerWidget extends StatefulWidget {
  final Function(String countryCode, String dialCode, String phone) onChanged;
  final bool isInputEnabled;
  final bool isAllowTab;

  const CountryPickerWidget({
    super.key,
    required this.onChanged,
    this.isInputEnabled = true,
    this.isAllowTab = true,
  });

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  String countryCode = 'KH';
  String dialCode = '+855';
  final TextEditingController phoneController = TextEditingController();

  void _updateValue() {
    widget.onChanged(
      countryCode,
      dialCode,
      phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      enabled: widget.isInputEnabled,
      onChanged: (_) => _updateValue(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        prefixIcon: CountryCodePicker(
          initialSelection: countryCode,
          favorite: const ['+855', 'US'],
          showDropDownButton: false,
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
          onChanged: (country) {
            setState(() {
              countryCode = country.code ?? '';
              dialCode = country.dialCode ?? '';
            });
            _updateValue();
          },
        ),
      ),
    );
  }
}
