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
                    CoffeeAnswer(title: "Шот эспрессо", type: .espresso),
                    CoffeeAnswer(title: "Молоко", type: .cappucino),
                    CoffeeAnswer(title: "Сливки", type: .raf),
                    CoffeeAnswer(title: "Вода", type: .americano)
                ]
            ),
            CoffeeQuestion(
                title: "Какой крепости предпочитаете напиток?",
                responseType: .ranged,
                answers: [
                    CoffeeAnswer(title: "Раф", type: .raf),
                    CoffeeAnswer(title: "Капучино", type: .cappucino),
                    CoffeeAnswer(title: "Американо", type: .americano),
                    CoffeeAnswer(title: "Эспреcсо", type: .espresso)
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
    let type: CoffeType
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
