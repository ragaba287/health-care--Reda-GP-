import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_care_system/view/Doctor%20details/controller/doctor_details_cubit.dart';
import 'package:health_care_system/view/Find%20Doctor/controller/find_doctor_cubit.dart';
import 'package:health_care_system/view/Home%20Screen/Controller/home_cubit.dart';
import 'package:health_care_system/view/Login/login%20cubit/login_controller_cubit.dart';
import 'package:health_care_system/view/Mab%20Screen/controller/map_cubit.dart';
import 'package:health_care_system/view/Sign%20Up/controller/sign_up_cubit.dart';
import 'package:health_care_system/view/Splash%20Screen/splash_screen.dart';

import 'core/blocObserver/bloc_observer.dart';
import 'core/cacheHelper/cache_helper.dart';
import 'core/dioHelper/dio_helper.dart';
import 'core/router/router.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //===============================================================
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  //===============================================================
  await CacheHelper.init();
  //===============================================================
  //===============================================================

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginControllerCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => MapCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => FindDoctorCubit(),
        ),
        BlocProvider(
          create: (context) => DoctorDetailsCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () => MaterialApp(
          title: 'Health Care System',
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          theme: theme(context),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
