import 'package:authtemplate/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:authtemplate/core/theme/theme.dart';
import 'package:authtemplate/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:authtemplate/features/auth/presentation/pages/login_page.dart';
import 'package:authtemplate/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AppUserCubit>()),
      BlocProvider(create: (_) => serviceLocator<AuthBlocBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBlocBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Blogs',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, state) {
          if (state) {
            print('state is AppUserLoggedIn');
            return const Scaffold(
              body: Center(
                child: Text('Welcome to the home page'),
              ),
            );
          }
          else
          return const LoginPage();
        },
      ),
    );
  }
}
