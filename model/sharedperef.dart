import 'package:shared_preferences/shared_preferences.dart';

var societyId = 'societyId';
class savelocalCode {
 SharedPreferences prefs;
 final myFuture = SharedPreferences.getInstance();

 toSaveStringValue(String keyName, String Value) async {
   prefs = await SharedPreferences.getInstance();
   prefs.setString(keyName, Value);
 }
 toSaveBoolValue(String keyName, bool Value) async {
   prefs = await SharedPreferences.getInstance();
   prefs.setBool(keyName, Value);
 }
 Future<String> toGetDate(String keyName,) async {
   prefs = await SharedPreferences.getInstance();
   return prefs.get(keyName,);
 }

}