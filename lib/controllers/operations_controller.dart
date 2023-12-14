import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class OperationsController extends GetxController {
  String strExpression = "";
  String strResult = "";

  onButtonClick(String buttonLabel) {
    strExpression += buttonLabel;
    update();
  }

  onClearClick() {
    strExpression = "";
    strResult = "";
    update();
  }

  showErrorOutput() {
    strResult = "Invalid Expression";
    update();
  }

  onAnswerClick() {
    Parser p = Parser();
    Expression exp = p.parse(strExpression);
    ContextModel contextModel = ContextModel();
    strResult = exp.evaluate(EvaluationType.REAL, contextModel).toString();
    update();
  }

  onDeleteClick() {
    strExpression = strExpression.substring(0, strExpression.length - 1);
    update();
  }
}
