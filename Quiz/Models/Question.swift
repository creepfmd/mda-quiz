//
//  Question.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

struct Question {
    let text: String
    let type: ResponseType
    let answers: [Answer]
    
    static let all: [Question] = [
        Question(text: "Какой цвет ваш любимый", type: .single, answers: [
            Answer(text: "Зеленый", percentage: [
                .Batman: 5,
                .CaptainAmerica: 20,
                .GreenLantern: 70,
                .Superman: 5
            ]),
            Answer(text: "Синий", percentage: [
                .Batman: 5,
                .CaptainAmerica: 70,
                .GreenLantern: 20,
                .Superman: 5
            ]),
            Answer(text: "Красный", percentage: [
                .Batman: 20,
                .CaptainAmerica: 5,
                .GreenLantern: 5,
                .Superman: 70
            ]),
            Answer(text: "Черный", percentage: [
                .Batman: 70,
                .CaptainAmerica: 5,
                .GreenLantern: 5,
                .Superman: 20
            ]),
        ]),
        Question(text: "Каким оружием владеете", type: .multiple, answers: [
            Answer(text: "Каратэ", percentage: [
                .Batman: 5,
                .CaptainAmerica: 20,
                .GreenLantern: 70,
                .Superman: 5
            ]),
            Answer(text: "Щит", percentage: [
                .Batman: 5,
                .CaptainAmerica: 70,
                .GreenLantern: 20,
                .Superman: 5
            ]),
            Answer(text: "Любым", percentage: [
                .Batman: 70,
                .CaptainAmerica: 5,
                .GreenLantern: 5,
                .Superman: 20
            ]),
            Answer(text: "Лазер", percentage: [
                .Batman: 20,
                .CaptainAmerica: 5,
                .GreenLantern: 5,
                .Superman: 70
            ]),
        ]),
        Question(text: "Много ли у вас денег", type: .range, answers: [
            Answer(text: "Ни копейки", percentage: [
                .Batman: 20,
                .CaptainAmerica: 5,
                .GreenLantern: 5,
                .Superman: 70
            ]),
            Answer(text: "", percentage: [
                .Batman: 5,
                .CaptainAmerica: 20,
                .GreenLantern: 70,
                .Superman: 5
            ]),
            Answer(text: "", percentage: [
                .Batman: 5,
                .CaptainAmerica: 70,
                .GreenLantern: 20,
                .Superman: 5
            ]),
            Answer(text: "Очень", percentage: [
                .Batman: 70,
                .CaptainAmerica: 5,
                .GreenLantern: 5,
                .Superman: 20
            ]),
        ]),
    ]
}
