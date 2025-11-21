import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/settings_cubit.dart';
import '../controllers/settings_state.dart';
import 'webview_view.dart';

import '../../social_login/views/social_login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SettingsLoggedOut) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SocialLoginScreen(),
              ),
              (route) => false,
            );
          }
        },
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 165, 169, 177),
                ],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white.withOpacity(0.9),
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: BlocBuilder<SettingsCubit, SettingsState>(
                            builder: (context, state) {
                              final cubit = context.read<SettingsCubit>();
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    'Configuration',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 32),

                                  // URL Input
                                  TextField(
                                    decoration: InputDecoration(
                                      labelText: 'Website URL',
                                      hintText: 'https://example.com',
                                      prefixIcon: const Icon(Icons.language),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade50,
                                    ),
                                    keyboardType: TextInputType.url,
                                    onChanged: cubit.updateUrl,
                                  ),
                                  const SizedBox(height: 24),

                                  // Device Selection
                                  DropdownButtonFormField<String>(
                                    value: cubit.selectedDevice,
                                    decoration: InputDecoration(
                                      labelText: 'Network Device',
                                      prefixIcon: const Icon(Icons.devices),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade50,
                                    ),
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'Printer',
                                        child: Text('Printer'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Scanner',
                                        child: Text('Scanner'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'POS Terminal',
                                        child: Text('POS Terminal'),
                                      ),
                                    ],
                                    onChanged: cubit.updateDevice,
                                  ),
                                  const SizedBox(height: 32),

                                  // Go Button
                                  ElevatedButton(
                                    onPressed: () {
                                      final url = cubit.url.trim();
                                      if (url.isNotEmpty) {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WebviewView(url: url),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please enter a valid URL',
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF2575FC),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 4,
                                    ),
                                    child: const Text(
                                      'Launch WebView',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.logout, color: Colors.black54),
                          onPressed: () =>
                              context.read<SettingsCubit>().logout(),
                          tooltip: 'Logout',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
