import 'app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
AppCubit() : super(AppInitialState());
static AppCubit get(context) => BlocProvider.of(context);


}