import 'package:fluid_ui_design/fluid_ui_design.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'playground_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FluidConfig config = FluidConfig.fromContext(context,
        spaceConfig: const SpaceConfig(),
        typeConfig: const TypeConfig(minBaseFontSize: 10, maxBaseFontSize: 12),
        viewportConfig: const ViewportConfig());

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xffe65728),
        textTheme: TextTheme(
          displayLarge: config.fromGoogleFont(GoogleFonts.firaSans).bold.displayLarge,
          displayMedium: config.fromGoogleFont(GoogleFonts.firaSans).bold.displayMedium,
          displaySmall: config.fromGoogleFont(GoogleFonts.firaSans).displaySmall,
          headlineLarge: config.fromGoogleFont(GoogleFonts.firaSans).bold.headlineLarge,
          headlineMedium: config.fromGoogleFont(GoogleFonts.firaSans).headlineMedium,
          headlineSmall: config.fromGoogleFont(GoogleFonts.firaSans).headlineSmall,
          bodyLarge: config.fromGoogleFont(GoogleFonts.firaSans).bodyLarge,
          bodyMedium: config.fromGoogleFont(GoogleFonts.firaSans).bodyMedium,
          bodySmall: config.fromGoogleFont(GoogleFonts.firaSans).bodySmall,
        ),
        extensions: <ThemeExtension<dynamic>>[
          config,
        ],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const PlaygroundPage();
  }
}
