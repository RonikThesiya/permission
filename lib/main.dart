import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';
import 'home_screen.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    )
  );
}