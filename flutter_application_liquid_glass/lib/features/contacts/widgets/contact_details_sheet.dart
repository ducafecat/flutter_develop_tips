import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../../theme/glass_settings.dart';
import '../models/contact.dart';
import 'contact_avatar.dart';

Future<String?> showContactDetailsSheet({
  required BuildContext context,
  required Contact contact,
  required VoidCallback onToggleFavorite,
}) {
  return GlassModalSheet.show<String>(
    context: context,
    halfSize: .68,
    enableInteractionGlow: false,
    enableSaturationGlow: false,
    interactionScale: 1,
    suppressInteractionOnChildren: true,
    fullSize: .92,
    barrierColor: const Color(0x73121C36),
    settings: clearGlass.copyWith(
      glassColor: const Color(0xC2EFF3FF),
      frost: 16,
      frostOpacity: .65,
      frostWeight: 1.4,
      blurWeight: .8,
    ),
    horizontalMargin: 10,
    bottomMargin: 10,
    topBorderRadius: 32,
    padding: EdgeInsets.zero,
    builder: (sheetContext) => DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: SizedBox.expand(
        child: DecoratedBox(
          key: const ValueKey('contact-sheet-underlay'),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xE6F1F5FF), Color(0xF5E9EFFB)],
            ),
          ),
          child: StatefulBuilder(
            builder: (context, updateSheet) => SingleChildScrollView(
              child: SafeArea(
                top: false,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                '联系人详情',
                                style: TextStyle(
                                  color: Color(0xFF596780),
                                  fontSize: 13,
                                ),
                              ),
                              const Spacer(),
                              GlassButton(
                                label: '关闭',
                                icon: const Icon(
                                  CupertinoIcons.xmark,
                                  size: 18,
                                ),
                                width: 36,
                                height: 36,
                                onTap: () => Navigator.pop(sheetContext),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              ContactAvatar(contact: contact, radius: 32),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      contact.name,
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF242D48),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      contact.company,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF596780),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: const Color(0x66FFFFFF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '手机号码',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF596780),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  contact.phone,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  '电子邮箱',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF596780),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  contact.email,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: _SheetAction(
                                  label: '拨打电话',
                                  icon: CupertinoIcons.phone,
                                  onTap: () =>
                                      Navigator.pop(sheetContext, 'call'),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _SheetAction(
                                  label: '发送消息',
                                  icon: CupertinoIcons.chat_bubble,
                                  onTap: () =>
                                      Navigator.pop(sheetContext, 'message'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _SheetAction(
                            label: contact.isFavorite ? '取消收藏' : '收藏联系人',
                            icon: contact.isFavorite
                                ? CupertinoIcons.star_fill
                                : CupertinoIcons.star,
                            onTap: () {
                              onToggleFavorite();
                              updateSheet(() {});
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _SheetAction extends StatelessWidget {
  const _SheetAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) => GlassButton(
      label: label,
      width: constraints.maxWidth,
      height: 50,
      shape: const LiquidRoundedSuperellipse(borderRadius: 12),
      settings: clearGlass.copyWith(
        glassColor: const Color(0x0AFFFFFF),
        frost: 0,
        frostOpacity: 0,
        frostWeight: 0,
        blur: .2,
        blurWeight: .15,
        thickness: 18,
      ),
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 19, color: const Color(0xFF4459A9)),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF344678),
            ),
          ),
        ],
      ),
      onTap: onTap,
    ),
  );
}
