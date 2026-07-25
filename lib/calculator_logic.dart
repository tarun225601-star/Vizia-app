class CalculatorLogic {
  String calculate(String expression) {
    try {
      return _calculate(expression);
    } catch (e) {
      return 'Error';
    }
  }

  String _calculate(String expression) {
    expression = expression.replaceAll(' ', '');
    return expression.split('').reduce((value, element) {
      if (element == '+') {
        return value + '+';
      } else if (element == '-') {
        return value + '-';
      } else if (element == '*') {
        return value + '*';
      } else if (element == '/') {
        return value + '/';
      } else {
        return value + element;
      }
    }).split('+').map((e) => e.split('-').map((e) => e.split('*').map((e) => e.split('/').map((e) => num.parse(e)).reduce((value, element) => value / element).toDouble()).reduce((value, element) => value * element).toDouble()).reduce((value, element) => value - element).toDouble()).reduce((value, element) => value + element).toDouble()).reduce((value, element) => value + element).toDouble().toString();
  }
}