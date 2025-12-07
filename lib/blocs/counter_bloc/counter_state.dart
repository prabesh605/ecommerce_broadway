abstract class CounterState {
  final int value;
  CounterState(this.value);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterSuccess extends CounterState {
  CounterSuccess(int value) : super(value);
}

class CounterError extends CounterState {
  CounterError(int value) : super(value);
}

class InternetProblem extends CounterState {
  InternetProblem(super.value);
}

// class LoadValue extends CounterState {
//   final int value;
//   LoadValue(this.value);
// }
