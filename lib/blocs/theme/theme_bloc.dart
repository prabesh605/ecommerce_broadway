import 'package:ecommerce_app/blocs/theme/theme_event.dart';
import 'package:ecommerce_app/blocs/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme()) {
    on<ChangeTheme>((event, emit) {
      if (state is LightTheme) {
        emit(DarkTheme());
      } else {
        emit(LightTheme());
      }
    });
  }
}
