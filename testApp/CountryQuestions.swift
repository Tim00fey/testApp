//
//  CountryQuestions.swift
//  testApp
//
//  Created by 1234 on 11.03.2023.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Напишите столицу Китая",
                responseType: .write,
                answers: [
                    Answer(title: "Пекин", correct: .right),
                    Answer(title: "пекин", correct: .right),
                    Answer(title: "", correct: .mistake)
                ]
            ),
            Question(
                title: "Выберите столицу Германии",
                responseType: .single,
                answers: [
                    Answer(title: "Мюнхен", correct: .mistake),
                    Answer(title: "Дрезден", correct: .mistake),
                    Answer(title: "Берлин", correct: .right),
                    Answer(title: "Лондон", correct: .mistake)
                ]
            ),
            Question(
                title: "Какие из городов являются столицами?",
                responseType:  .multiple,
                answers: [
                    Answer(title: "Вашингтон", correct: .right),
                    Answer(title: "Нью-Йорк", correct: .mistake),
                    Answer(title: "Париж", correct: .right),
                    Answer(title: "Марсель", correct: .mistake)
                ]
            )
        ]
    }
}

enum ResponseType {
    case write
    case single
    case multiple
}

struct Answer {
    let title: String
    let correct: Correct
}

enum Correct: Int {
    case right = 1
    case mistake = -1
}


