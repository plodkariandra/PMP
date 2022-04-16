import 'dart:convert';

import 'coffee_mahine_impl.dart';
import 'drink.dart';
import 'dart:io';

late final CoffeeMachineImpl coffeeMachine;

void main(List<String> args) {
  coffeeMachine = CoffeeMachineImpl(
    modelName: 'SuperMachine',
    currentAmountOfCoffee: 53,
    currentAmountOfMilk: 33,
    currentAmountOfWater: 23,
    currentAmountOfSugar: 45,
    maxAmountOfCoffee: 400,
    maxAmountOfMilk: 400,
    maxAmountOfWater: 400,
    maxAmountOfSugar: 400,
    cash: 200,
    availableDrinks: {
      Drink.cappuccino,
      Drink.freakshake,
      Drink.americano,
      Drink.affogato,
      Drink.latte,
    },
  );

  interface();
}

void interface() {
  String? exit = '';

  while (exit != 'exit') {
    print('Choose function: ');
    print('0 - load coffe');
    print('1 - load milk');
    print('2 - load sugar');
    print('3 - load water');
    print('4 - get cash');
    print('5 - buy one drinks');
    print('6 - buy drinks');
    print('7 - print all');
    print('exit - if you want to exit');
    try {
      exit = stdin.readLineSync(encoding: utf8);
      switch (exit) {
        case '0':
          coffeeMachine.loadCoffe(getAmount('coffee'));
          break;
        case '1':
          coffeeMachine.loadMilk(getAmount('milk'));
          break;
        case '2':
          coffeeMachine.loadSugar(getAmount('sugar'));
          break;
        case '3':
          coffeeMachine.loadWater(getAmount('water'));
          break;
        case '4':
          coffeeMachine.getCash();
          break;
        case '5':
          buyDrink();
          break;
        case '6':
          buyDrinks();
          break;
        case '7':
          DrinkExt.printDrinks();
          break;
        default:
      }
    } catch (exp) {
      print(exp.toString());
    }
  }
}

int getAmount(String thing) {
  try {
    print('Enter amount of $thing');
    final amount = stdin.readLineSync(encoding: utf8);
    return int.parse('$amount');
  } catch (exp) {
    rethrow;
  }
}

void buyDrink() {
  try {
    print('Choose one');
    coffeeMachine.printDrinks();
    final amount = stdin.readLineSync(encoding: utf8);
    final drink = DrinkExt.getById(int.parse('$amount'));
    print('Enter amount of cash (with point)');
    final cash = stdin.readLineSync(encoding: utf8);
    coffeeMachine.makeDrink(drink, double.parse('$cash'));
  } catch (exp) {
    rethrow;
  }
}

void buyDrinks() {
  try {
    print('Enter numbers with spaces');
    coffeeMachine.printDrinks();
    final amount = stdin.readLineSync(encoding: utf8);
    final drinks = DrinkExt.getDrinks(amount ?? '');
    print('Enter amount of cash (with point)');
    final cash = stdin.readLineSync(encoding: utf8);
    coffeeMachine.makeDrinks(drinks, double.parse('$cash'));
  } catch (exp) {
    rethrow;
  }
}
