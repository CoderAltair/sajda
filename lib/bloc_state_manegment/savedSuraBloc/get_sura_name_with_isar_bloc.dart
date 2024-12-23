import 'package:Sajda/models/isar_sura/user.dart';
import 'package:Sajda/services/iser_service/isar_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_sura_name_with_isar_event.dart';
part 'get_sura_name_with_isar_state.dart';

class GetSuraNameWithIsarBloc
    extends Bloc<GetSuraNameWithIsarEvent, GetSuraNameWithIsarState> {
  GetSuraNameWithIsarBloc() : super(GetSuraNameWithIsarInitial()) {
    on<StartSuraNameWithIsarEvent>(getIsarSuraNameAndIndex);
    on<RemoveSuraNameWithIsarEvent>(removeIsarSuraNameAndIndex);
  }

  Future<void> getIsarSuraNameAndIndex(
    StartSuraNameWithIsarEvent event,
    Emitter<GetSuraNameWithIsarState> emmit,
  ) async {
    List<User> newUser = await IsarService().getAllSura();
    emmit(StartSuraNameWithIsarState(newUser));
  }

  Future<void> removeIsarSuraNameAndIndex(
    RemoveSuraNameWithIsarEvent event,
    Emitter<GetSuraNameWithIsarState> emmit,
  ) async {
    await IsarService().removeSura(event.id);
    emmit(ReloadingSuraNameWithIsarState());
  }
}
