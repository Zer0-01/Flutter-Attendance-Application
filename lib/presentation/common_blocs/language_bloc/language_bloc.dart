import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({required String language})
      : super(LanguageState(language: language)) {
    on<OnSelectLanguageEvent>(_onSelectLanguage);
  }

  void _onSelectLanguage(
    OnSelectLanguageEvent event,
    Emitter<LanguageState> emit,
  ) {
    emit(state.copyWith(language: event.language));
  }
}
