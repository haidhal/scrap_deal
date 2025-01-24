import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:scrap_deal/bloc/auth_bloc/bloc/auth_bloc.dart';
import 'package:scrap_deal/bloc/cubits/category_cubit.dart';
import 'package:scrap_deal/controller/categoryscreen_controller.dart';
import 'package:scrap_deal/controller/addresscontroller.dart';
import 'package:scrap_deal/controller/profile_controller.dart';
import 'package:scrap_deal/firebase_options.dart';
import 'package:scrap_deal/view/pages/splash_screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter(); // initialize hive
  // Hive.registerAdapter(AddressModelAdapter()); // register the adapter

  // await Hive.openBox(AppUtils.addressBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Hivecontroller(),
            
          ),
          ChangeNotifierProvider(create: (context) => CategoryscreenController(),),
           ChangeNotifierProvider(create: (context) => ProfileController(),)
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
