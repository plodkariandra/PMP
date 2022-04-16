import 'drink.dart';

abstract class CoffeeMachine {
  final String modelName;
  final Set<Drink> availableDrinks;
  final int maxAmountOfCoffee;
  final int maxAmountOfMilk;
  final int maxAmountOfWater;
  final int maxAmountOfSugar;
  int currentAmountOfCoffee;
  int currentAmountOfMilk;
  int currentAmountOfWater;
  int currentAmountOfSugar;

  double cash;

  CoffeeMachine({
    required this.modelName,
    required this.currentAmountOfCoffee,
    required this.currentAmountOfMilk,
    required this.currentAmountOfWater,
    required this.currentAmountOfSugar,
    required this.maxAmountOfCoffee,
    required this.maxAmountOfMilk,
    required this.maxAmountOfWater,
    required this.maxAmountOfSugar,
    required this.cash,
    required this.availableDrinks,
  })  : assert(modelName.isNotEmpty && !modelName.contains(' ')),
        assert(currentAmountOfCoffee <= maxAmountOfCoffee),
        assert(currentAmountOfMilk <= maxAmountOfMilk),
        assert(currentAmountOfWater <= maxAmountOfWater),
        assert(currentAmountOfSugar <= maxAmountOfSugar),
        assert(cash > 0),
        assert(availableDrinks.length == 4 || availableDrinks.length == 5);

  void makeDrink(Drink drink, double cashForDrink);
  void makeDrinks(List<Drink> drinks, double cashForDrink);
  void loadCoffe(int amount);
  void loadMilk(int amount);
  void loadWater(int amount);
  void loadSugar(int amount);
  double getCash();
}
