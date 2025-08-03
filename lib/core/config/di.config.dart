// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:soundx/core/config/external_injectable.dart' as _i637;
import 'package:soundx/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i214;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalInjectable = _$ExternalInjectable();
    gh.lazySingleton<_i59.FirebaseAuth>(() => externalInjectable.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => externalInjectable.googleSigIn);
    gh.lazySingleton<_i214.AuthRemoteDataSource>(
      () => _i214.AuthRemoteDataSource(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
      ),
    );
    return this;
  }
}

class _$ExternalInjectable extends _i637.ExternalInjectable {}
