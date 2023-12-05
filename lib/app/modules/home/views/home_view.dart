import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = HomeController();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF09A785),
                Color(0xFF1AC79B),
              ],
              transform: GradientRotation(90),
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.savedTexts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 0,
                        surfaceTintColor: Colors.white,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          title: Row(
                            children: [
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(controller.savedTexts[index]),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      controller.editItem(index);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      controller.deleteText(index);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: TextField(
                  onChanged: (value) {
                    controller.userInput.value = value;
                  },
                  onSubmitted: (value) {
                    controller.addText();
                  },
                  controller:
                      TextEditingController(text: controller.userInput.value),
                  decoration: InputDecoration(
                    hintText: 'Digite seu texto',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        controller.addText();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
