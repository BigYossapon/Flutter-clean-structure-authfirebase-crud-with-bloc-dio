import 'package:apptester/src/features/login/presentation/login_Screen.dart';

import 'package:apptester/src/features/register/presentation/register_Layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/presentations/home_Screen.dart';

import '../data/repositories/register_repositoryImpl.dart';
import 'bloc/post_register/post_register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterBloc = BlocProvider<PostRegisterBloc>(
        create: (_) => PostRegisterBloc(RegisterRepositoryimpl()));
    return MultiBlocProvider(
      providers: [RegisterBloc],
      child: const RegisterLayout(),
    );
  }
}
