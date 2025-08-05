import UIKit

//1. Создать объект “Школа” со свойствами: массив учеников, название школы,
//адрес (адрес -новый объект с координатами x, y, street name) и директор (у директора новые поля:
//experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).
//У ученика хранить имя, фамилию, номер класса, кортеж “название предмета - оценка”
//. Ученик
//наследуется от Person.
//У ученика сделать конструктор со всеми параметрами, добавить дефолтные значения к
//некоторым из них.
//Написать метод для ученика, выводящий информацию о студенте в формате
//“Фамилия Имя (Класс)
//предмет: оценка
//предмет: оценка”
//Написать метод для школы, который выводит информацию о школе.
//Уделите особое внимание выбору, что использовать: класс или структуру, var или let,
//модификаторы доступа.

class School {
    var students: [String] = ["Jordan","Brayant", "Stocton"]
    var nameSchool: String
    
    init(nameSchool: String) {
        self.nameSchool = nameSchool
    }
    
    func getInfoAboutSchool() {
    print("Name school is  - \(nameSchool), in school studies -  \(students.count) students")
  }
}

class Adress {
    var coordinates: (x: Double, y: Double)
    var streetName: String
    
    init(coordinates: (x: Double, y: Double), streetName: String) {
        self.coordinates = coordinates
        self.streetName = streetName
    }
    
}

class Person {
    var name: String
    var surname: String
    var age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
    
    func getInfo() {
        print("Hello, my name is - \(name), my surname is - \(surname)")
    }
}
class Director: Person {
    var experience: Int
    var rating: Double
    
    init(experience: Int, rating: Double, name: String, surname: String, age: Int) {
        self.experience = experience
        self.rating = rating
        super.init(name: name, surname: surname, age: age)
    }
}

class Student: Person {
    var classNumber: Int = 7
    var infoAboutProgress: (item: String, grade: Int, item2: String, grade2: Int)
    init(classNumber: Int, infoAboutProgress: (item: String, grade: Int, item2: String, grade2: Int ), name: String, surname: String, age: Int) {
        self.infoAboutProgress = infoAboutProgress
        super.init(name: name, surname: surname, age: age)
    }
    
    override func getInfo() {
        print("Hello, my name is - \(name), my surname is - \(surname). I study in - \(classNumber) class, my progress item - \(infoAboutProgress.item), grade \(infoAboutProgress.grade), and - \(infoAboutProgress.item2), grade \(infoAboutProgress.grade2) now")
    }
}

let student = Student(classNumber: 7, infoAboutProgress: (item: "Biology", grade: 9 , item2: "Math", grade2: 5), name: "Lebron", surname: "James", age: 40)
student.getInfo()
let infoSchool = School(nameSchool: "Spase Jam")
infoSchool.getInfoAboutSchool()


//2. Создайте протокол PaymentMethod с требованиями:
//Свойство balance (текущий баланс)
//Метод pay(amount: Double) -> Bool
//Реализуйте протокол в:
//Классе CreditCard (должен списывать сумму + 1% комиссии)
//Классе CryptoWallet (должен проверять, хватает ли криптовалюты)
//Напишите функцию processPayment(using method: PaymentMethod, amount: Double), которая обрабатывает платеж.


protocol PaymentMethod  {
    var balance: Double { get set }
    
    func pay(amount: Double) -> Bool
}


class CreditCard: PaymentMethod {
    
    var balance: Double = 100
    var commission: Double = 0
    
    
    func pay(amount: Double) -> Bool {
        
        if amount > 0 && balance >= amount {
            balance -= amount
            commission =  amount * 0.01
            print("Платеж на сумму \(amount) евро, текущий баланс - \(balance) евро, комиссия за платеж - \(commission) евро")
            return true
        } else {
            print("ошибка платежа")
            return false
        }
    }
}

let infoPay = CreditCard()
infoPay.pay(amount: 20)

class CryptoWallet: PaymentMethod {
    var balance: Double = 100
    var commission: Double = 0
    
    func pay(amount: Double) -> Bool {
        if amount > 0 && balance >= amount {
            balance -= amount
            commission =  amount * 0.01
            print("Платеж на сумму \(amount) евро, текущий баланс - \(balance) евро, комиссия за платеж - \(commission) евро")
            return true
        } else {
            print("ошибка платежа")
            return false
        }
    }
}

func processPayment(using method: CryptoWallet, amount: Double) {
    var balance = 50.0
    if balance > 0 && amount <= balance {
        method.pay(amount: amount)
        print("Платежи совершены")
    } else {
        print("недостаточно средств")
    }
}


let wallet = CryptoWallet()
wallet.pay(amount: 25)
wallet.balance
wallet.commission

processPayment(using: CryptoWallet(), amount: 50)

