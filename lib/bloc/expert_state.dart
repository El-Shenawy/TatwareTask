part of 'expert_bloc.dart';

abstract class ExpertState extends Equatable {
  const ExpertState();

  @override
  List<Object> get props => [];
}

class ExpertInitial extends ExpertState {}

class ExpertPageLoadedState extends ExpertState {
  ExpertData? expertData;

  ExpertPageLoadedState({this.expertData});
}
