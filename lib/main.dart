import 'package:exam/common/bloc/theme_bloc.dart';
import 'package:exam/common/theme/extension/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, AppThemeMode>(
        builder: (context, theme) {
          return MaterialApp(
            theme: context.lightTheme,
            darkTheme: context.darkTheme,
            debugShowCheckedModeBanner: false,
            themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const MainApp(),
          );
        },
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Person Card',
                      style: context.textStyle.headline1,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Person Name',
                      style: context.textStyle.body1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeBloc>().toggle();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: context.colors.secondary,
              ),
              child: Text(
                'Toggle Theme',
                style: context.textStyle.body1.copyWith(
                  color: context.colors.onSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
