// ignore_for_file: unused_local_variable

import 'package:authtemplate/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:authtemplate/core/network/connection_checker.dart';
import 'package:authtemplate/core/secrets/app_secrets.dart';
import 'package:authtemplate/features/auth/data/data_sources/auth_remote_data_sources.dart';
import 'package:authtemplate/features/auth/data/repository/auth_repository_implementation.dart';
import 'package:authtemplate/features/auth/domain/repositories/auth_repository.dart';
import 'package:authtemplate/features/auth/domain/usecases/current_user.dart';
import 'package:authtemplate/features/auth/domain/usecases/user_login.dart';
import 'package:authtemplate/features/auth/domain/usecases/user_sign_up.dart';
import 'package:authtemplate/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:authtemplate/features/blog/data/data_source/blog_local_data_source.dart';
import 'package:authtemplate/features/blog/data/data_source/blog_remote_data_source.dart';
import 'package:authtemplate/features/blog/data/repository/blog_repository_impl.dart';
import 'package:authtemplate/features/blog/domain/repositories/blog_repository.dart';
import 'package:authtemplate/features/blog/domain/usercases/get_all_blogs.dart';
import 'package:authtemplate/features/blog/domain/usercases/upload_blog.dart';
import 'package:authtemplate/features/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'init_dependencies.main.dart';