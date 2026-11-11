import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

import '../../theme/glass_settings.dart';
import 'data/sample_contacts.dart';
import 'models/contact.dart';
import 'widgets/contact_backdrop.dart';
import 'widgets/contact_details_sheet.dart';
import 'widgets/contact_tile.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final _contacts = sampleContacts();
  String _query = '';
  int _tab = 0;
  static const _titles = ['所有联系人', '我的收藏', '最近联系'];

  List<Contact> get _visible {
    final q = _query.trim().toLowerCase();
    final result = _contacts.where((c) {
      final matchesTab =
          _tab == 0 || (_tab == 1 ? c.isFavorite : c.lastContact != null);
      return matchesTab &&
          (c.name.contains(q) ||
              c.company.toLowerCase().contains(q) ||
              c.phone.replaceAll(' ', '').contains(q.replaceAll(' ', '')));
    }).toList();
    if (_tab == 2) {
      result.sort((a, b) => b.lastContact!.compareTo(a.lastContact!));
    }
    return result;
  }

  Future<void> _openContact(Contact contact) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final action = await showContactDetailsSheet(
      context: context,
      contact: contact,
      onToggleFavorite: () => setState(() {
        contact.isFavorite = !contact.isFavorite;
      }),
    );
    if (!mounted || action == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          action == 'call'
              ? '模拟通话：正在呼叫 ${contact.name}（${contact.phone}）'
              : '模拟消息：已打开与 ${contact.name} 的会话',
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contacts = _visible;
    return Scaffold(
      body: GlassScaffold(
        background: const ContactBackdrop(),
        bottomBar: GlassTabBar.bottom(
          settings: clearGlass,
          indicatorColor: const Color(0x225665C0),
          selectedIndex: _tab,
          onTabSelected: (index) => setState(() => _tab = index),
          tabs: const [
            GlassTab(icon: Icon(CupertinoIcons.person_2), label: '全部'),
            GlassTab(icon: Icon(CupertinoIcons.star), label: '收藏'),
            GlassTab(icon: Icon(CupertinoIcons.clock), label: '最近'),
          ],
        ),
        body: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(26, 24, 26, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '保持联络，让美好发生',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF78839F),
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '联系人',
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF242D48),
                                  letterSpacing: -1,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  '${_contacts.length} 位朋友',
                                  style: const TextStyle(
                                    color: Color(0xFF78839F),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          GlassSearchBar(
                            settings: clearGlass,
                            placeholder: '搜索姓名、公司或电话号码',
                            onChanged: (value) =>
                                setState(() => _query = value),
                          ),
                          const SizedBox(height: 26),
                          Row(
                            children: [
                              Text(
                                _titles[_tab],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF596580),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '${contacts.length} 位',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF78839F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (contacts.isEmpty)
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _query.isNotEmpty
                                  ? CupertinoIcons.search
                                  : CupertinoIcons.star,
                              size: 46,
                              color: const Color(0xFF9CA6C2),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _query.isNotEmpty ? '没有找到联系人' : '还没有收藏的联系人',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _query.isNotEmpty
                                  ? '试试其他姓名、公司或电话号码'
                                  : '点击联系人，将重要的人加入收藏',
                              style: const TextStyle(color: Color(0xFF78839F)),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: SliverList.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];
                          return ContactTile(
                            contact: contact,
                            onTap: () => _openContact(contact),
                          );
                        },
                      ),
                    ),
                  const SliverToBoxAdapter(child: SizedBox(height: 130)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
