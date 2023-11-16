import 'package:blood_fighter/const/network_check.dart';
import 'package:get/get.dart';
class NetworkDpendency {
  static void init(){
  Get.put<NetworkController>(NetworkController(),permanent: true);
  }
}