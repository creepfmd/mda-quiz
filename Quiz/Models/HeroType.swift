//
//  HeroType.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

enum HeroType: String {
    case Superman = "Супермэн"
    case GreenLantern = "Зеленый Фонарь"
    case Batman = "Бэтмэн"
    case CaptainAmerica = "Капитан Америка"
    
    var image: String {
        switch self {
        case .Superman:
            return "Superman"
        case .GreenLantern:
            return "GreenLantern"
        case .Batman:
            return "Batman"
        case .CaptainAmerica:
            return "CaptainAmerica"
        }
    }
    
    var definition: String {
        switch self {
        case .Superman:
            return "Непробиваемый"
        case .GreenLantern:
            return "Инопланетный и зеленый"
        case .Batman:
            return "Технологичный и черный"
        case .CaptainAmerica:
            return "Прирожденный лидер нации"
        }
    }
}
