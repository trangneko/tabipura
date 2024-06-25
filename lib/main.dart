import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabipura/pages/chat_screen.dart';
import 'package:tabipura/pages/home_page.dart';

import 'bloc/city_bloc.dart';
import 'bloc/travel_plan_bloc.dart';
import 'pages/result_page.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme =
        createTextTheme(context, "Noto Sans", "M PLUS Rounded 1c");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CityBloc()..add(LoadSuggestedCities())),
        BlocProvider(create: (_) => TravelPlanBloc()),
      ],
      child: MaterialApp(
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        // home: const ChatScreen(
        //   title: "Flutter + AI",
        // ),
        title: 'AI Travel Planner',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/result': (context) => ResultScreen(),
        },
      ),
    );
  }
}
