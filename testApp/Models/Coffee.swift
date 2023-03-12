//
//  Coffee.swift
//  testApp
//
//  Created by Kirill Kniga on 12.03.2023.
//

struct CoffeeQuestion {
    let title: String
    let responseType: CoffeeResponseType
    let answers: [CoffeeAnswer]
    
    static func getQuestions() -> [CoffeeQuestion] {
        [
            CoffeeQuestion(
                title: "Что вы любите в составе кофейного напитка?",
                responseType: .multiple,
                answers: [
                    CoffeeAnswer(title: "Шот эспрессо", coffee: .espresso),
                    CoffeeAnswer(title: "Молоко", coffee: .cappucino),
                    CoffeeAnswer(title: "Сливки", coffee: .raf),
                    CoffeeAnswer(title: "Вода", coffee: .americano)
                ]
            ),
            CoffeeQuestion(
                title: "Какой крепости предпочитаете напиток?",
                responseType: .ranged,
                answers: [
                    CoffeeAnswer(title: "Раф", coffee: .raf),
                    CoffeeAnswer(title: "Капучино", coffee: .cappucino),
                    CoffeeAnswer(title: "Американо", coffee: .americano),
                    CoffeeAnswer(title: "Эспреесо", coffee: .espresso)
                ]
            )
        ]
    }
}

enum CoffeeResponseType {
    case multiple
    case ranged
}

struct CoffeeAnswer {
    let title: String
    let coffee: CoffeType
}

enum ingredient: String {
    case espresso = "espresso shot"
    case milk = "milk"
    case cream = "cream"
    case water = "water"
}

enum CoffeType: String {
    case espresso = "espresso"
    case americano = "americano"
    case cappucino = "cappucino"
    case raf = "raf coffee"
    
    var definition: String {
        switch self {
            
        case .espresso:
            return "espresso"
        case .americano:
            return "americano"
        case .cappucino:
            return "cappucino"
        case .raf:
            return "raf coffee"
        }
    }
}
