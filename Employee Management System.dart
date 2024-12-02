import 'dart:io';

abstract class Employee {
  String _name; 
  double _salary;

  Employee(this._name, this._salary);
  String get name => _name;
  double get salary => _salary;

  double calculateBonus();
}

class Manager extends Employee {
  Manager(String name, double salary) : super(name, salary);

  @override
  double calculateBonus() {
    return _salary * 0.25;
  }
}

class Developer extends Employee {
  Developer(String name, double salary) : super(name, salary);

  @override
  double calculateBonus() {
    return _salary * 0.15; 
  }
}

void main() {
  double readDouble(String prompt) {
    while (true) {
      stdout.write(prompt);
      String? input = stdin.readLineSync();
      if (input != null && double.tryParse(input) != null) {
        return double.parse(input);
      } else {
        print("Invalid input. Enter a valid number.");
      }
    }
  }

  stdout.write("Enter Manager's name: ");
  String managerName = stdin.readLineSync() ?? "Unknown";
  double managerSalary = readDouble("Enter Manager's salary: ");
  Employee manager = Manager(managerName, managerSalary);

  stdout.write("Enter Developer's name: ");
  String developerName = stdin.readLineSync() ?? "Unknown";
  double developerSalary = readDouble("Enter Developer's salary: ");
  Employee developer = Developer(developerName, developerSalary);

  print("\n=== Bonus Details ===");
  print("Manager ${manager.name}'s bonus: ${manager.calculateBonus()}");
  print("Developer ${developer.name}'s bonus: ${developer.calculateBonus()}");
}
