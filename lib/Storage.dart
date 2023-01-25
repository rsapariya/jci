import 'package:get_storage/get_storage.dart';

final getdata = GetStorage();
save(key, val) {
  final date = GetStorage();
  date.write(key, val);
}
