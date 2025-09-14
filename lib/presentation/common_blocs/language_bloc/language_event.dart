part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();
  @override
  List<Object> get props => [];
}

class OnSelectLanguageEvent extends LanguageEvent {
  final String language;
  const OnSelectLanguageEvent({required this.language});

  @override
  List<Object> get props => [language];
}
