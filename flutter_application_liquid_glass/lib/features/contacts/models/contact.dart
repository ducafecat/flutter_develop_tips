import 'package:flutter/material.dart';

class Contact {
  Contact(
    this.id,
    this.name,
    this.company,
    this.phone,
    this.email,
    this.color, {
    this.isFavorite = false,
    this.lastContact,
  });
  final int id;
  final String name, company, phone, email;
  final Color color;
  bool isFavorite;
  final DateTime? lastContact;
}
