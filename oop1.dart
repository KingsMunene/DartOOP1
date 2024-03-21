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



  Dog(this.food, this.habitat);

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
    print("The dog is Roaming");
  }
  
}

void main(List<String> args) {
  var dog = Dog("Meet", "Kennel");

  dog.makeNoise();
  dog.roaming();
}