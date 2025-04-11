import '../../../../core/constant/app_linker.dart';
import '../../domain/entities/user_entitiy.dart';
import '../../domain/usecases/fetch_user_usecase.dart';

class UserProvider with ChangeNotifier {
  final FetchUsersUsecase fetchUsersUsecase;

  UserProvider(this.fetchUsersUsecase);

  List<User> _users = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';
  List<User> _filteredUsers = [];

  List<User> get usersbyname =>
      _searchQuery.isEmpty ? _users : _filteredUsers;

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await fetchUsersUsecase();
      _filteredUsers = _users;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    _filteredUsers = _users
        .where((user) =>
        user.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
