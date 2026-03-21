import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: Text('Settings', style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12),
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stylish User', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text('user@stylish.com', style: GoogleFonts.montserrat(fontSize: 13, color: Colors.grey)),
                    ],
                  ),
                ),
                const Icon(Icons.edit, color: Color(0xFFFD6E87)),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildSettingsSection('Account', [
            _buildSettingsTile(Icons.person_outline, 'Edit Profile', onTap: () {}),
            _buildSettingsTile(Icons.location_on_outlined, 'Saved Addresses', onTap: () {}),
            _buildSettingsTile(Icons.payment, 'Payment Methods', onTap: () {}),
          ]),

          const SizedBox(height: 16),

          _buildSettingsSection('Notifications', [
            _buildSwitchTile(Icons.notifications_outlined, 'Push Notifications', true),
            _buildSwitchTile(Icons.email_outlined, 'Email Notifications', false),
          ]),

          const SizedBox(height: 16),

          _buildSettingsSection('General', [
            _buildSettingsTile(Icons.help_outline, 'Help & Support', onTap: () {}),
            _buildSettingsTile(Icons.info_outline, 'About', onTap: () {}),
            _buildSettingsTile(Icons.privacy_tip_outlined, 'Privacy Policy', onTap: () {}),
          ]),

          const SizedBox(height: 24),

          // Logout Button
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.red,
              padding: const EdgeInsets.symmetric(vertical: 14),
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            icon: const Icon(Icons.logout, color: Colors.red),
            label: Text('Log Out', style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.red)),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> tiles) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1)]),
          child: Column(children: tiles),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: GoogleFonts.montserrat(fontSize: 14)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value) {
    return StatefulBuilder(
      builder: (context, setState) {
        return ListTile(
          leading: Icon(icon, color: Colors.black87),
          title: Text(title, style: GoogleFonts.montserrat(fontSize: 14)),
          trailing: Switch(
            value: value,
            activeColor: const Color(0xFFFD6E87),
            onChanged: (val) => setState(() => value = val),
          ),
        );
      },
    );
  }
}
