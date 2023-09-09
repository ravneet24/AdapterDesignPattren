import UIKit


//Adaptor Pattren ---> The Adapter Pattern is a design pattern that enables objects with similar functionality to work together despite having incompatible interfaces.

protocol Jumping {
    func jump()
}

class cat: Jumping {
    func jump() {
        print("cat jumps")
    }
    
    
}

class dog: Jumping {
    func jump() {
        print("dog jumps")
    }
    
    
}


//Now we have one another class whose interface is not compatable but it is similar. we will make it compatable by usig adapptor pattern either by using extensions or by using new class/structure

//original class
final class Frog {
    func leap() {
        print("Frog leaps - we can say jumping also")
    }
}

//we need to pass two types of arguments here. one for Jumping type and another for Frog Type because we can use frog as Jumoing for now
func printAllJumpingAnimals(animals: [Jumping], frog: Frog) {
    for animal in animals {
        animal.jump()
    }
    
    frog.leap()
}

printAllJumpingAnimals(animals: [cat(), dog()], frog: Frog())


//Now lets make it compatable with out Jumping objects

//With Extension
extension Frog: Jumping {
    func jump() {
        leap()
    }
}

//Now lets create method to print all animals who can jump.and use frog too
//uncomment to test extension approach
func printAllJumpingAnimals(animals: [Jumping]) {
    for animal in animals {
        animal.jump()
    }
}

printAllJumpingAnimals(animals: [cat(), dog(), Frog()])


//with new structure or class

struct FrogAdaptor: Jumping {
    private let frog: Frog
    init(frog: Frog) {
        self.frog = frog
    }
    func jump() {
        frog.leap()
    }
}

let frog = Frog()
let frogAdaptor = FrogAdaptor(frog: frog)

printAllJumpingAnimals(animals: [cat(), dog(), frogAdaptor])
