import 'package:app_flutter_starter_for_job/src/core/constants/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ModernSearchBar extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final VoidCallback onSearchTap;

  const ModernSearchBar({
    super.key,
    this.hintText = 'Search...',
    this.controller,
    required this.onSearchTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: onSearchTap,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.09),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Icon(Icons.search , color: AppColors.grey,),
              const Gap(10),
              Expanded(
                child: Text(
                  hintText ?? '',
                  style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
