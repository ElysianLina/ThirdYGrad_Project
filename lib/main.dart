import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pharma/data/repository/maps_repo.dart';
import 'package:pharma/data/wabservices/places_webservices.dart';
import 'package:pharma/firebase_options.dart';
import 'package:pharma/maps/maps_cubit.dart';
//import 'package:pharma/nearbypharma/CustomMarkerInfoWindow.dart';
//import 'package:pharma/nearbypharma/homa_page.dart';
//import 'package:pharma/nearbypharma/nearby.dart';
import 'package:pharma/screens/map_screen.dart';
import 'package:pharma/screens/pharmacist.screen.dart';

//import 'package:pharma/screens/mapp_screen.dart';
import 'package:pharma/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final placesWebservices = PlacesWebservices();
    final mapsRepository = MapsRepository(placesWebservices);

    return MultiProvider(
      providers: [
        BlocProvider<MapsCubit>(
          create: (context) => MapsCubit(mapsRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Pharmacist Service',
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => const MyHomePage(),

          '/pharmacist': (context) => const PharmaScreen(),
          // '/home': (context) => const HomePage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          useMaterial3: false,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //home: WelcomeScreen(),
        home: const WelcomeScreen(),

        //home: const CustomMarketInfoWindow(),
        //   ),
      ),
    );
  }
}
