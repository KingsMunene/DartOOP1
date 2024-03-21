import 'dart:io';
//import './dog.txt' as datad;
class Roam{
  void roaming(){
    print("Roaming");
  }
}

abstract class Animal extends Roam{
  abstract String food;
  abstract String habitat;
  
  void eat();
  void makeNoise();
}

class  Dog extends Animal {
  @override
  String food;

  @override
  String habitat;

  String name;



  Dog(this.food, this.habitat, this.name);

// Defines a factory constructor for the Dog class that takes a file path as a parameter.
  // This constructor reads the contents of the file at the given path and creates a new Dog instance based on the file contents.
  factory Dog.fromFile(String filePath){
    // Creates a new File object for the given file path.
    final file = File(filePath);

    // Reads the contents of the file as a list of lines and stores the result in the 'lines' variable.
    final lines = file.readAsLinesSync();

// Checks if the file contains at least two lines.
    if(lines.length >= 2){

       // Extracts the food value from the first line of the file.
      final food = lines[0];

      // Extracts the habitat value from the second line of the file.
      final habitat = lines[1];

      // Extracts the name value from the third line of the file.
      final name = lines[2];

// Creates a new Dog instance with the extracted food, habitat, and name values, and returns it.
      return Dog(food, habitat, name);
    }else {
      throw Exception('Invalid file format');
    }
  }

  @override
  void eat() {
    print("$name is eating $food");
  }

  @override
  void makeNoise() {
    print("woof Woof");
  }
  @override
  void roaming() {
    print("$name is Roaming");
  }
  
}

void main(List<String> args) {
  //This variable stores the dog instance to be initialized from a file
  var dog;

//Get an instance from the file dog.txt
  try{
    dog = Dog.fromFile('C:/Users/munen/Documents/Dev/Flutter/Dart/Dartoop1/dog.txt');
  }catch(e){
    print('Error: $e');
  }

   // Initialize other dog objects
  var dog2 = Dog("Meat", "Forest", "Kenyan Shepherd");
  var dog3 = Dog("Anything", "Anywhere", "Mwitu");

  var dogs = [dog, dog2, dog3];

// Loop through the list of dog objects and print their names
  for (dog in dogs) {
    print("Dog name: ${dog.name}");
    dog.roaming();
    dog.eat();
    dog.makeNoise();
    print(" ");
  }
}