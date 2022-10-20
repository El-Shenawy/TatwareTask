part of 'expert_bloc.dart';

abstract class ExpertEvent extends Equatable {
  const ExpertEvent();

  @override
  List<Object> get props => [];
}

class ExpertPageInitializedEvent extends ExpertEvent {}
