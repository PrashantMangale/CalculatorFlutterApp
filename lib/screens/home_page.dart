import 'package:calculator_app/common_widgets/custom_button.dart';
import 'package:calculator_app/controllers/operations_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> buttons = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "*",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "ANS",
    "=",
  ];

  closeApp() {
    Navigator.of(context).pop();
  }

  bool isNumber(String buttonText) {
    return (buttonText == "1" ||
        buttonText == "2" ||
        buttonText == "3" ||
        buttonText == "4" ||
        buttonText == "5" ||
        buttonText == "6" ||
        buttonText == "7" ||
        buttonText == "8" ||
        buttonText == "9" ||
        buttonText == "0");
  }

  bool isOperator(String buttonText) {
    return (buttonText == "+" ||
        buttonText == "*" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "%" ||
        buttonText == ".");
  }

  Color getBackGroundColor(String buttonText) {
    if (isNumber(buttonText) || buttonText == ".") {
      return Colors.black38;
    } else if (buttonText.toUpperCase() == "ANS" || buttonText == "=") {
      return Colors.amber;
    } else {
      return Colors.deepOrangeAccent;
    }
  }

  Widget expressionWidget(OperationsController controller) {
    return Container(
      padding: const EdgeInsets.only(right: 20, top: 70),
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.black12,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              controller.strExpression,
              style: const TextStyle(fontSize: 36, color: Colors.black26),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              controller.strResult,
              style: const TextStyle(fontSize: 40, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonsWidget(OperationsController controller) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        String buttonText = buttons[index];
        return CustomButton(
            buttonLabel: buttonText,
            buttonColor: getBackGroundColor(buttonText),
            callback: () {
              if (buttonText == buttons[0]) {
                controller.onClearClick();
              } else if (buttonText == buttons[1]) {
                controller.onDeleteClick();
              } else if (buttonText == buttons[18] ||
                  buttonText == buttons[19]) {
                if (controller.strExpression.isNotEmpty &&
                    isOperator(controller.strExpression
                        .substring(controller.strExpression.length - 1))) {
                  controller.showErrorOutput();
                } else {
                  controller.onAnswerClick();
                }
              } else {
                controller.onButtonClick(buttonText);
              }
            });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var operationController = Get.find<OperationsController>();

    return WillPopScope(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: GetBuilder<OperationsController>(
              builder: (controller) {
                return expressionWidget(operationController);
              },
            )),
            Expanded(
              flex: 2,
              child: buttonsWidget(operationController),
            )
          ],
        ),
      ),
      onWillPop: () => closeApp(),
    );
  }
}
