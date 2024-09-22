import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:here_for_you_app/Components/kElevatedButton.dart';
import 'package:here_for_you_app/app/modules/home/views/home_view.dart';
import '../controllers/question_screen_controller.dart';

class QuestionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuestionController controller = Get.put(QuestionController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: OutlinedButton(
          onPressed: () {
            Get.offAll(() => const HomeView());
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
                const EdgeInsets.symmetric(vertical: 0, horizontal: 7)),
          ),
          child: const Text(
            "Go Home",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Obx(() {
                return Text(
                  "${controller.currentQuestionIndex.value + 1}/${controller.questions.length}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                );
              }),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.questions.isEmpty) {
          return const Center(
            child: Text('No questions available'),
          );
        }

        final currentQuestion = controller.currentQuestion;
        if (currentQuestion.options.isEmpty) {
          return const Center(
            child: Text('No options available for this question'),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                currentQuestion.question,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              currentQuestion.options.length <= 4
                  ? GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 160,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: currentQuestion.options.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                            onTap: () {
                              controller.selectOption(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value == index
                                    ? Colors.grey.shade300
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      currentQuestion.options[index].toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        controller.getOptionIcon(index),
                                        scale: 1.7,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    )
                  : Column(
                      children: [
                        ...List.generate(currentQuestion.options.length,
                            (index) {
                          return Card(
                            color: Colors.white,
                            shadowColor: Colors.black45,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(currentQuestion.options[index]),
                              titleTextStyle:
                                  Get.theme.textTheme.titleLarge?.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              trailing: Radio<int>(
                                value: index,
                                groupValue:
                                    controller.selectedOptionIndex.value,
                                onChanged: (value) {
                                  controller.selectedOptionIndex.value = value!;
                                },
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
              const Spacer(),
              kElevatedButton(
                  text: "Next",
                  onPressed: () {
                    controller.nextQuestion();
                  }),
              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}
