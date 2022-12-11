import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.enabled,
    this.searchOnTap,
    this.controller,
    this.onSubmitted,
  }) : super(key: key);

  final VoidCallback? searchOnTap;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      enabled: enabled,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFECECEC),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        suffixIcon: InkWell(
          onTap: searchOnTap,
          child: const Icon(Icons.search),
        ),
        hintText: "Search",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
