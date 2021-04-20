import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:infinit_food/cubit/cubit.dart';
import 'ui/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodCubit>(create: (_) => FoodCubit()),
        BlocProvider<UserCubit>(create: (_) => UserCubit()),
        BlocProvider<TransactionCubit>(create: (_) => TransactionCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}
