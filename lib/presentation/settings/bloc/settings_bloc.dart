import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:qack/constants/key_name.dart';
import 'package:qack/presentation/settings/models/models.dart';
import 'package:qack/presentation/settings/respository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.settingsRepository})
      : super(const SettingsInitial()) {
    on<SettingsFetch>(_onSettingsFetch);
    on<SettingsEditTranslator>(_onSettingsEditTranslator);
  }

  final SettingsRepository settingsRepository;

  Future<void> _onSettingsFetch(
    SettingsFetch event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      // Check if the translator settings are already loaded
      if (event.translatorSettings != null) {
        emit(
          SettingsFetchSuccess(event.translatorSettings),
        );
      } else {
        emit(const SettingsFetchLoading());

        final translatorSettings = await settingsRepository.getAPIKey();

        emit(
          SettingsFetchSuccess(translatorSettings),
        );
      }
    } on Exception catch (e) {
      emit(
        SettingsFetchFailure(e),
      );
    }
  }

  Future<void> _onSettingsEditTranslator(
    SettingsEditTranslator event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      // Validate the form
      if (event.formKey.currentState == null ||
          !event.formKey.currentState!.validate()) {
        return;
      }

      emit(const SettingsEditTranslatorLoading());

      // Load all the keys in to the apiKeys map
      final apiKeys = <String, String>{
        // Google api keys
        KeyNameConstants.google: event.googleApiKey ?? '',
        // Baidu api keys
        KeyNameConstants.baiduAppID: event.baiduAppID ?? '',
        KeyNameConstants.baiduSecretKey: event.baiduSecretKey ?? '',
        KeyNameConstants.deepSeek: event.deepSeekApiKey ?? '',
      };

      final translatorSettings = TranslatorSettings(
        enabledTranslators: event.enabledTranslators,
        apiKeys: apiKeys,
      );

      // Save the translator settings to the secure storage
      await settingsRepository.saveAPIKey(
        translatorSettings: translatorSettings,
      );

      emit(
        SettingsEditTranslatorSuccess(translatorSettings),
      );
    } on Exception catch (e) {
      emit(
        SettingsEditTranslatorFailure(e),
      );
    }
  }
}
