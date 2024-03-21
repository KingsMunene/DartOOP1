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

  factory Dog.fromFile(String filePath){
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    if(lines.length >= 2){
      final food = lines[0];
      final habitat = lines[1];
      final name = lines[2];

      return Dog(food, habitat, name);
    }else {
      throw Exception('Invalid file format');
    }
  }

  @override
  void eat() {
    print("The Dog is eating $food");
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
    dog.makeNoise();
    print(" ");
  }
}