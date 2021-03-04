import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class ConnectivityBloc
    extends Bloc<ConnectivityBlocEvent, ConnectivityBlocState> {
  ConnectivityBloc() : super(ConnectivityBlocState());
  var isOffLine = false;
  Timer timer;

  void onInitial() {
    timer?.cancel();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        timer?.cancel();
        if (isOffLine != true) {
          isOffLine = true;
          add(ConnectivityBlocEvent.setUpdate);
        }
      }
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        timer?.cancel();
        checkConnection();
        timer = new Timer.periodic(new Duration(seconds: 10), timerCall);
      }
    });
  }

  void timerCall(Timer timer) {
    checkConnection();
  }

  void checkConnection() async {
    bool hasConnection = false;
    try {
      final response = await http.get('https://www.google.com');
      if (response.statusCode != 200) {
        hasConnection = false;
      } else {
        hasConnection = true;
      }
    } on Exception catch (_) {
      hasConnection = false;
    }
    if (isOffLine != !hasConnection) {
      isOffLine = !hasConnection;
      add(ConnectivityBlocEvent.setUpdate);
    }
  }

  @override
  ConnectivityBlocState get initialState => ConnectivityBlocState.initial();

  @override
  Stream<ConnectivityBlocState> mapEventToState(
      ConnectivityBlocEvent event) async* {
    yield state.copyWith(
      isOffLine: isOffLine,
    );
  }
}

enum ConnectivityBlocEvent { setUpdate }

class ConnectivityBlocState {
  final bool isOffLine;

  ConnectivityBlocState({
    this.isOffLine,
  });

  factory ConnectivityBlocState.initial() {
    return ConnectivityBlocState(
      isOffLine: false,
    );
  }

  ConnectivityBlocState copyWith({
    bool isOffLine,
  }) {
    return ConnectivityBlocState(
      isOffLine: isOffLine ?? this.isOffLine,
    );
  }
}
