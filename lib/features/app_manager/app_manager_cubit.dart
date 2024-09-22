import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange_bay/features/app_manager/app_manager_state.dart';

class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit() : super(AppManagerInitial());

  void onObscureChange() => emit(ObscureChange());

  void onLoadingChange() => emit(LoadingChange());
}
