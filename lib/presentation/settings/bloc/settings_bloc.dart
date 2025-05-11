import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';
import 'package:qack/presentation/settings/respository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({required this.settingsRepository})
      : super(const SettingsInitial()) {
    on<SettingsFetch>(_onSettingsFetch);
  }

  final SettingsRepository settingsRepository;

  Future<void> _onSettingsFetch(
    SettingsFetch event,
    Emitter<SettingsState> emit,
  ) async {
    try {
      emit(const SettingsFetchLoading());
      
      final deepLApiKey = await settingsRepository.getDeepLAPIKey();

      emit(
        SettingsFetchSuccess(deepLApiKey),
      );
    } on Exception catch (e) {
      emit(
        SettingsFetchFailure(e),
      );
    }
  }
}
