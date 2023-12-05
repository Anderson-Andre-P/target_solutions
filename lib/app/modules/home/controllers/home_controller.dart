import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxString userInput = ''.obs;
  RxList<String> savedTexts = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedTexts();
  }

  void addText() {
    if (userInput.isNotEmpty) {
      savedTexts.add(userInput.value);
      saveTexts();
      userInput.value = '';
    }
  }

  void deleteText(int index) {
    Get.defaultDialog(
      title: 'Confirmação',
      middleText: 'Deseja realmente excluir este texto?',
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            savedTexts.removeAt(index);
            saveTexts();
            Get.back();
          },
          child: const Text('Excluir'),
        ),
      ],
    );
  }

  void editItem(int index) async {
    TextEditingController editController =
        TextEditingController(text: savedTexts[index]);

    await Get.defaultDialog(
      title: 'Editar Frase',
      content: TextField(
        controller: editController,
        decoration: const InputDecoration(labelText: 'Nova Frase'),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            savedTexts[index] = editController.text;
            saveTexts();
            Get.back();
          },
          child: const Text('Salvar'),
        ),
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancelar'),
        ),
      ],
    );
  }

  void saveTexts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('savedTexts', savedTexts);
  }

  void loadSavedTexts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? loadedTexts = prefs.getStringList('savedTexts');
    if (loadedTexts != null) {
      savedTexts.assignAll(loadedTexts);
    }
  }
}
