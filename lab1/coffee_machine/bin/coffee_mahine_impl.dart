import 'coffee_machine.dart';
import 'drink.dart';

class CoffeeMachineImpl extends CoffeeMachine {
  CoffeeMachineImpl({
    required String modelName,
    required int currentAmountOfCoffee,
    required int currentAmountOfMilk,
    required int currentAmountOfWater,
    required int currentAmountOfSugar,
    required int maxAmountOfCoffee,
    required int maxAmountOfMilk,
    required int maxAmountOfWater,
    required int maxAmountOfSugar,
    required double cash,
    required Set<Drink> availableDrinks,
  }) : super(
          modelName: modelName,
          currentAmountOfCoffee: currentAmountOfCoffee,
          currentAmountOfMilk: currentAmountOfMilk,
          currentAmountOfWater: currentAmountOfWater,
          currentAmountOfSugar: currentAmountOfSugar,
          maxAmountOfCoffee: maxAmountOfCoffee,
          maxAmountOfMilk: maxAmountOfMilk,
          maxAmountOfWater: maxAmountOfWater,
          maxAmountOfSugar: maxAmountOfSugar,
          cash: cash,
          availableDrinks: availableDrinks,
        );

  @override
  double getCash() {
    print('That is your  cash - $cash');
    return cash;
  }

  @override
  void loadCoffe(int amount) {
    currentAmountOfCoffee += amount;
    print('Coffee was loaded');
    if (currentAmountOfCoffee > maxAmountOfCoffee) {
      print('You achieved max amount of coffee');
      currentAmountOfCoffee = maxAmountOfCoffee;
    }
    print('Current amount of coffee is $currentAmountOfCoffee');
  }

  @override
  void loadMilk(int amount) {
    currentAmountOfMilk += amount;
    print('Milk was loaded');
    if (currentAmountOfMilk > maxAmountOfMilk) {
      print('You achieved max amount of milk');
      currentAmountOfMilk = maxAmountOfMilk;
    }
    print('Current amount of milk is $currentAmountOfMilk');
  }

  @override
  void loadSugar(int amount) {
    currentAmountOfSugar += amount;
    print('Sugar was loaded');
    if (currentAmountOfSugar > maxAmountOfSugar) {
      print('You achieved max amount of sugar');
      currentAmountOfSugar = maxAmountOfSugar;
    }
    print('Current amount of sugar is $currentAmountOfSugar');
  }

  @override
  void loadWater(int amount) {
    currentAmountOfWater += amount;
    print('Water was loaded');
    if (currentAmountOfWater > maxAmountOfWater) {
      print('You achieved max amount of water');
      currentAmountOfWater = maxAmountOfWater;
    }
    print('Current amount of water is $currentAmountOfWater');
  }

  @override
  void makeDrinks(List<Drink> drinks, double cashForDrink) {
    double costs = drinks
        .map((drink) => drink.cost)
        .reduce((value, element) => value + element);

    if (costs > cashForDrink) {
      throw Exception('You should pay more money');
    }
    if (cash - costs > cash + costs) {
      throw Exception('Coffee machine has no rest');
    }

    for (final drink in drinks) {
      makeDrink(drink, costs);
      costs -= drink.cost;
    }
  }

  @override
  void makeDrink(Drink drink, double cashForDrink) {
    if (!availableDrinks.contains(drink)) {
      throw Exception('There is no ${drink.name}');
    }
    if (drink.cost > cashForDrink) {
      throw Exception('You should pay more money');
    }
    if (cash - drink.cost > cash + drink.cost) {
      throw Exception('Coffee machine has no rest');
    }

    if (drink.sugarAmount > currentAmountOfSugar) {
      throw Exception('There is not so much sugar');
    }

    if (drink.milkAmount > currentAmountOfMilk) {
      throw Exception('There is not so much milk');
    }

    if (drink.waterAmount > currentAmountOfWater) {
      throw Exception('There is not so much water');
    }

    if (drink.coffeAmount > currentAmountOfCoffee) {
      throw Exception('There is not so much coffe');
    }

    currentAmountOfCoffee -= drink.coffeAmount;
    currentAmountOfMilk -= drink.milkAmount;
    currentAmountOfWater -= drink.waterAmount;
    currentAmountOfSugar -= drink.sugarAmount;
    cash += drink.cost;

    final rest = cashForDrink - drink.cost;

    print('${drink.name} was created. Your rest is $rest');
  }

  void printDrinks() {
    for (final drink in availableDrinks) {
      drink.printDrink();
    }
  }
}
