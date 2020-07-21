import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final String message;

  Failures({this.message = ''});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class CacheFailure extends Failures {
  CacheFailure({String mess}) : super(message: mess);

  @override
  // TODO: implement props
  List<Object> get props => super.props;
}
