import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/contact.dart';
import 'contact_avatar.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({super.key, required this.contact, required this.onTap});

  final Contact contact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Material(
      color: Colors.white.withValues(alpha: .20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0x70FFFFFF)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        key: ValueKey('contact-${contact.id}'),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              ContactAvatar(contact: contact),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          contact.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2C3550),
                          ),
                        ),
                        if (contact.isFavorite)
                          const Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: Icon(
                              CupertinoIcons.star_fill,
                              size: 13,
                              color: Color(0xFFC49A53),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      contact.company,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF596780),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      contact.phone,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF596780),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                CupertinoIcons.chevron_right,
                size: 15,
                color: Color(0xFFA9B1C6),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
