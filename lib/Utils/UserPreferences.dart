

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  // Singleton instance
  static final UserPreferences _instance = UserPreferences._internal();

  // Private constructor
  UserPreferences._internal();

  // Factory constructor
  factory UserPreferences() {
    return _instance;
  }

  // SharedPreferences instance
  static SharedPreferences? _preferences;

  // Keys for storing data
  static const String _keyUserId = 'userId';
  static const String _keyUsername = 'username';
  static const String _keyUserEmail = 'userEmail';
  static const String _keyPhoneNumber = 'phoneNumber';
  static const String _keyPassword = '_keyPassword';
  static const String _keyinvitionid = '_keyinvitionid';

  static const String _keyEventId = 'eventId';
  static const String _keyhostone = 'hostone';
  static const String _keyhosttwo = 'hosttwo';
  static const String _keydate = 'date';
  static const String _keynoofmember = 'noofmember';
  static const String _keyeventname = 'eventname';
  static const String _keyislogin = 'islogin';
  static const String _keyisadmin = 'isadmin';
  static const String _keyismember = 'ismember';


  static const String _keyboyparent = 'boyparent';

  static const String _keylocation = 'boylocattion';

  static const String _keygirlparent = 'girlparent';

  static const String _keyEventCreatedby = 'EventCreatedby';
  static const String _keyEventCreatedbyID = 'EventCreatedbyid';

  static const String _keyEventIdAD = 'eventIdAD'; // Added key for event ID

  // Initialize SharedPreferences instance
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save user data
  Future<void> saveUserData(int userId, String username, String userEmail, String phoneNumber,String Pasword,String invitionid) async {
    await _preferences?.setInt(_keyUserId, userId);
    await _preferences?.setString(_keyUsername, username);
    await _preferences?.setString(_keyUserEmail, userEmail);
    await _preferences?.setString(_keyPhoneNumber, phoneNumber);
    await _preferences?.setString(_keyPassword, Pasword);

  }


  Future<void> saveEventDetails(int userId, String username) async {
    await _preferences?.setInt(_keyEventCreatedbyID, userId);
    await _preferences?.setString(_keyEventCreatedby, username);

  }

  // Save event-related data
  Future<void> saveEventId(String eventId) async {
    await _preferences?.setString(_keyEventId, eventId);
  }


  Future<void> savebpoysparent(String eventId) async {
    await _preferences?.setString(_keyboyparent, eventId);
  }

  Future<void> saveloction(String eventId) async {
    await _preferences?.setString(_keylocation, eventId);
  }

  Future<void> savegirlparent(String eventId) async {
    await _preferences?.setString(_keygirlparent, eventId);
  }

  Future<void> saveEventIdAd(String eventId) async {
    await _preferences?.setString(_keyEventIdAD, eventId);
  }

  Future<void> saveHostOne(String hostOne) async {
    await _preferences?.setString(_keyhostone, hostOne);
  }

  Future<void> saveHostTwo(String hostTwo) async {
    await _preferences?.setString(_keyhosttwo, hostTwo);
  }

  Future<void> saveEventName(String eventName) async {
    await _preferences?.setString(_keyeventname, eventName);
  }

  Future<void> saveDate(String date) async {
    await _preferences?.setString(_keydate, date);
  }

  Future<void> saveNumberOfMembers(int numberOfMembers) async {
    await _preferences?.setString(_keynoofmember, numberOfMembers.toString());
  }

  Future<void> saveIsLogin(bool isLogin) async {
    await _preferences?.setBool(_keyislogin, isLogin);
  }

  Future<void> saveIsAdmin(bool isAdmin) async {
    await _preferences?.setBool(_keyisadmin, isAdmin);
  }

  Future<void> saveIsMember(bool isMember) async {
    await _preferences?.setBool(_keyismember, isMember);
  }

  // Getters to retrieve data
  int? get userId => _preferences?.getInt(_keyUserId);
  String? get username => _preferences?.getString(_keyUsername);
  String? get userEmail => _preferences?.getString(_keyUserEmail);
  String? get phoneNumber => _preferences?.getString(_keyPhoneNumber);
  String? get paswword => _preferences?.getString(_keyPassword);


  int? get createdbyid => _preferences?.getInt(_keyEventCreatedbyID);
  String? get createdbyname => _preferences?.getString(_keyEventCreatedby);

  String? get invitionid => _preferences?.getString(_keyinvitionid);

  // Get event-related data
  String? get eventId => _preferences?.getString(_keyEventId);
  String? get eventIdAd => _preferences?.getString(_keyEventIdAD);

  String? get hostOne => _preferences?.getString(_keyhostone);
  String? get hostTwo => _preferences?.getString(_keyhosttwo);
  String? get date => _preferences?.getString(_keydate);
  String? get eventName => _preferences?.getString(_keyeventname);
  String? get numberOfMembers => _preferences?.getString(_keynoofmember);

  String? get boyparent => _preferences?.getString(_keyboyparent);
  String? get girlparent => _preferences?.getString(_keygirlparent);

  String? get venus => _preferences?.getString(_keylocation);

  bool get isLogin => _preferences?.getBool(_keyislogin) ?? false;
  bool get isAdmin => _preferences?.getBool(_keyisadmin) ?? false;
  bool get isMember => _preferences?.getBool(_keyismember) ?? false;


  // Clear user data
  Future<void> clearUserData() async {
    await _preferences?.remove(_keyUserId);
    await _preferences?.remove(_keyUsername);
    await _preferences?.remove(_keyUserEmail);
    await _preferences?.remove(_keyPhoneNumber);
    await _preferences?.remove(_keyEventId);
    await _preferences?.remove(_keyismember);
    await _preferences?.remove(_keyisadmin);
    await _preferences?.remove(_keyislogin);
  }

  // Save login session
  Future<void> saveLoginSession(bool isLoggedIn) async {
    await _preferences?.setBool(_keyislogin, isLoggedIn);
  }
}