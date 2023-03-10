import 'package:dtogen_app/application/generator/generator_bloc/generator_bloc.dart';
import 'package:dtogen_app/application/generator/generator_settings/generator_settings_cubit.dart';
import 'package:dtogen_app/dependencies/toor.dart';

final generatorSettingsCubitFactory =
    toor.registerFactory<GeneratorSettingsCubit>(GeneratorSettingsCubit.new);

final generatorBlocFactory =
    toor.registerFactory<GeneratorBloc>(GeneratorBloc.new);
