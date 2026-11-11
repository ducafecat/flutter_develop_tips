import 'package:flutter/material.dart';

import '../models/contact.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({super.key, required this.contact, this.radius = 25});
  final Contact contact;
  final double radius;
  @override
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius,
    backgroundColor: contact.color.withValues(alpha: .15),
    child: Text(
      contact.name.substring(0, 1),
      style: TextStyle(
        color: contact.color,
        fontSize: radius * .72,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
