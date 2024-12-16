import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomFormfield extends StatelessWidget {
  const CustomFormfield({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
