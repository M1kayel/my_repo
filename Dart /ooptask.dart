import"dart:io";
import"dart:math";
//1
abstract class Shape{
	double area();
	double perimeter();
}

class Rectangle extends Shape{
	double width;
	double height;
	Rectangle(this.width,this.height);
	
	@override 
	double area(){
		return width * height;	}

	@override
	double perimeter(){
		return 2*(width+height);	}
}

class Circle extends Shape{
	double r;
	Circle(this.r);

	@override
	double area(){
		return pi * (r * 2);	}

	@override
	double perimeter(){
		return 2 * pi * r;	}
}

// 2
class Animal {
	void makeSound(){
		print('Inputed animal sound');	}
}


class Dog extends Animal{
	@override
	void makeSound(){
		print("HAF");	}
}

class Cow extends Animal{
	@override
	void makeSound(){
		print("MU");	}
}

class Cat extends Animal{
	@override
	void makeSound(){
		print("MYAU");	}
}

// 3
abstract class Flyable{
	void fly();
}

class Bird implements Flyable{
	@override
	void fly(){
		print('fly');}
}
class Airplane implements Flyable{
	@override
	void fly(){
		print('fly');}
}

// 4
class MathUtils {
	double a;
	double b;
	MathUtils(this.a,this.b);

	static add(a,b){
		return a+b;}
	static substract(a,b){
		return a-b;}
	static multiply(a,b){
		return a*b;}
	static divide(a,b){
		if(a != 0){
			return a/b;}
		else
			return 'Not possible';}
}
void main(){
	//1
	
	print('Input digit for area');
	double a = double.parse(stdin.readLineSync()!);
	print('Input digit for perimeter');
	double b = double.parse(stdin.readLineSync()!);
	Rectangle rectangle = Rectangle (a,b);
	print(rectangle.area());
	print(rectangle.perimeter());
	
	print('\n');	
	
	//2
	print('Print the animal name');
	while (true){
	String A = (stdin.readLineSync()!);
	
		
	if (A == "dog"){
		
		Animal animal = Animal();
		animal.makeSound();
		Dog dog = Dog();
		dog.makeSound();
		break;
		}
	else if (A == "cow"){
		
		Animal animal = Animal();
		animal.makeSound();
		Cow cow = Cow();
		cow.makeSound();
		break;
		}
	else if (A == "cat"){
		
		Animal animal = Animal();
		animal.makeSound();
		Cat cat = Cat();
		cat.makeSound();
		break;
		}
	else {
		print("False Input / print / dog/cow/cat");
		}
		}
	
	print('\n');
	
	//3
	Flyable bird = Bird();
	bird.fly();

	print('\n'); 
  	
	//4
	print('Input first digit for math');
	a = double.parse(stdin.readLineSync()!);
	print('Input second digit for math');
	b = double.parse(stdin.readLineSync()!);
	print(MathUtils.add(a,b));
	print(MathUtils.substract(a,b));
	print(MathUtils.multiply(a,b));
	print(MathUtils.divide(a,b));
}
