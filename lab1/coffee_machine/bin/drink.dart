enum Drink {
  affogato,
  americano,
  latte,
  mocha,
  cappuccino,
  coldBrew,
  espresso,
  frappe,
  freakshake,
  icedLatte,
  icedMocha,
  irishCoffee,
}

extension DrinkExt on Drink {
  static List<Drink> getDrinks(String line) {
    final indexes = line.split(' ').map((item) {
      return int.parse(item);
    }).toList();
    final List<Drink> drinks = [];
    for (final index in indexes) {
      drinks.add(getById(index));
    }
    return drinks;
  }

  static Drink getById(int index) {
    return Drink.values[index];
  }

  static void printDrinks() {
    for (final drink in Drink.values) {
      drink.printDrink();
    }
  }

  void printDrink() {
    print('$index: $name - $cost\$');
  }

  double get cost {
    switch (this) {
      case Drink.affogato:
        return 2.3;
      case Drink.americano:
        return 4.3;
      case Drink.latte:
        return 1.3;
      case Drink.mocha:
        return 2.6;
      case Drink.cappuccino:
        return 12;
      case Drink.coldBrew:
        return 3.4;
      case Drink.espresso:
        return 12.6;
      case Drink.frappe:
        return 3.3;
      case Drink.freakshake:
        return 6.4;
      case Drink.icedLatte:
        return 5.6;
      case Drink.icedMocha:
        return 4.5;
      case Drink.irishCoffee:
        return 3.8;
    }
  }

  int get coffeAmount {
    switch (this) {
      case Drink.affogato:
        return 2;
      case Drink.americano:
        return 4;
      case Drink.latte:
        return 1;
      case Drink.mocha:
        return 2;
      case Drink.cappuccino:
        return 12;
      case Drink.coldBrew:
        return 3;
      case Drink.espresso:
        return 12;
      case Drink.frappe:
        return 3;
      case Drink.freakshake:
        return 6;
      case Drink.icedLatte:
        return 5;
      case Drink.icedMocha:
        return 4;
      case Drink.irishCoffee:
        return 3;
    }
  }

  int get milkAmount {
    switch (this) {
      case Drink.affogato:
      case Drink.americano:
      case Drink.latte:
      case Drink.frappe:
        return 3;
      case Drink.mocha:
      case Drink.icedLatte:
      case Drink.espresso:
        return 6;
      case Drink.cappuccino:
        return 2;
      case Drink.coldBrew:
      case Drink.freakshake:
        return 4;
      case Drink.icedMocha:
        return 5;
      case Drink.irishCoffee:
        return 8;
    }
  }

  int get waterAmount {
    switch (this) {
      case Drink.affogato:
      case Drink.americano:
      case Drink.latte:
      case Drink.mocha:
      case Drink.cappuccino:
      case Drink.coldBrew:
      case Drink.espresso:
        return 1;
      case Drink.frappe:
      case Drink.freakshake:
      case Drink.icedLatte:
      case Drink.icedMocha:
      case Drink.irishCoffee:
        return 2;
    }
  }

  int get sugarAmount {
    switch (this) {
      case Drink.affogato:
      case Drink.americano:
      case Drink.latte:
      case Drink.mocha:
      case Drink.cappuccino:
        return 0;
      case Drink.coldBrew:
      case Drink.espresso:
      case Drink.frappe:
      case Drink.freakshake:
      case Drink.icedLatte:
        return 1;
      case Drink.icedMocha:
      case Drink.irishCoffee:
        return 2;
    }
  }
}
