import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:smart_garcom/app_configuration.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';

class ApplicationBloc extends BlocBase {
  AppConfiguration _appConfiguration;

  Stream<AppConfiguration> get appConfiguration =>
      _appConfigurationSubject.stream;

  final _appConfigurationSubject = BehaviorSubject<AppConfiguration>();

  Sink<Color> get primaryColor => _primaryColorController.sink;

  final _primaryColorController = StreamController<Color>();

  ApplicationBloc() {
    _appConfiguration = AppConfiguration(
      brightness: Brightness.light,
      primaryColor: Colors.blueGrey,
    );

    _appConfigurationSubject.add(_appConfiguration);
  }

  @override
  void dispose() {
    _appConfigurationSubject?.close();
    _primaryColorController?.close();
  }
}
