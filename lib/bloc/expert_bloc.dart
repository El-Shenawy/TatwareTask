import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task/models/experts.dart';

import '../utilities/data_repository.dart';

part 'expert_event.dart';
part 'expert_state.dart';

class ExpertBloc extends Bloc<ExpertEvent, ExpertState> {
  ExpertDataProvider expertDataProvider = ExpertDataProvider();
  ExpertBloc() : super(ExpertInitial()) {
    add(ExpertPageInitializedEvent());
  }
//
  @override
  Stream<ExpertState> mapEventToState(
    ExpertEvent event,
  ) async* {
    if (event is ExpertPageInitializedEvent) {
      ExpertData expertData = await expertDataProvider.getShopItems();
      yield ExpertPageLoadedState(expertData: expertData);
    }
  }
}
