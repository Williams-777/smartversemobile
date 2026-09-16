import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/app_route.dart';
import 'core/di/service_locator.dart';
import 'core/network/token_storage.dart';

import 'feautures/dashboard/data/repository/appliance_repository.dart';
import 'feautures/dashboard/data/repository/calculation_repository.dart';
import 'feautures/dashboard/presentation/bloc/appliance_cubit.dart';
import 'feautures/dashboard/presentation/bloc/calculation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await TokenStorage.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ApplianceCubit(ApplianceRepository())..loadAppliances()),
        BlocProvider(create: (_) => CalculationCubit(CalculationRepository())),

      ],
      child: ScreenUtilInit(
        designSize: const Size(357, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'Smartvert',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorSchemeSeed: const Color(0xFFF2790A),
            useMaterial3: true,
          ),
          initialRoute: AppRoute.splash,
          routes: AppRoute.routes,
        ),
      ),
    );
  }
}