import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmaray/lib.dart';

class UploadPrescriptionController extends GetxController {
  List<int> selectedIndexes = [];

  List<File> selectedPrescriptions = [];

  bool isSelectionAvailable = false;

  var apiClient = ApiClient();

  Future getGalleryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedPrescriptions.add(File(image.path));
    }
    update();
  }

  Future uploadFile({required bool isCall}) async {
    for (var element in selectedPrescriptions) {
      dynamic res = await apiClient.uploadImage(element, isCall);
      print(res);
    }
  }

  Future getCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      selectedPrescriptions.add(File(image.path));
    }
    update();
  }
}
