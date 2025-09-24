import 'package:flutter/material.dart';

Widget dropDownmenuWidget({
  required String title,
  required String hint,
  required List<String> roles,
  required final controll,
  required ThemeData theme,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: theme.textTheme.titleMedium),
      const SizedBox(height: 6),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.onSurface.withOpacity(.4),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: DropdownMenu<String>(
          width: double.infinity,
          controller: controll,
          initialSelection: roles.first,
          onSelected: (a) {
            a = controll.text;
          },
          hintText: hint,
          textStyle: theme.textTheme.bodyMedium,
          leadingIcon: Icon(
            Icons.work_rounded,
            color: theme.colorScheme.primary,
          ),
          dropdownMenuEntries: [
            for (var role in roles) DropdownMenuEntry(value: role, label: role),
          ],
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(
              theme.colorScheme.surface,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ),
      ),
    ],
  );
}
