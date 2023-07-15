import 'repo.dart';
class ApplicationHandleRepo implements Repository {
	// This file get the app configurable data from server.

	@override
	Future fetchOrReadAndReturn({bool offline = false}) async {
		return offline ? await _readDataFromFile() : await _fetchFromServer();
	}

	_fetchFromServer(){}

	_readDataFromFile(){}
}