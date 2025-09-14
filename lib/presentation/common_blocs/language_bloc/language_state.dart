part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final String language;

  const LanguageState({this.language = 'en'});

  LanguageState copyWith({String? language}) {
    return LanguageState(language: language ?? this.language);
  }

  @override
  List<Object> get props => [language];
}
