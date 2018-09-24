import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/style.dart';

class ApplicationBloc extends BlocBase {
  ThemeData _themeData;

  /// Stream que retorna o tema
  ///
  /// Não usar nas telas (somente ao iniciar a aplicação)
  Stream<ThemeData> get theme => _themeSubject.stream;
  final _themeSubject = BehaviorSubject<ThemeData>();

  Sink<Brightness> get brightness => _brightnessController.sink;
  final _brightnessController = StreamController<Brightness>();

  Sink<Color> get primaryColor => _primaryColorController.sink;
  final _primaryColorController = StreamController<Color>();

  ApplicationBloc() {
    // Tema padrão
    _changeThemeData(getTheme());

    _brightnessController.stream.listen((brightness) =>
        _changeThemeData(_themeData.copyWith(brightness: brightness)));

    _primaryColorController.stream.listen(
        (color) => _changeThemeData(_themeData.copyWith(primaryColor: color)));
  }

  @override
  void dispose() {
    _themeSubject?.close();

    _brightnessController?.close();
    _primaryColorController?.close();
  }

  void _changeThemeData(ThemeData themeData) {
    _themeData = getTheme(brightness: themeData.brightness, primaryColor: themeData.primaryColor);
    _themeSubject.add(_themeData);
  }
}
