//
//  HeroType.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

enum HeroType: String {
    case Superman = "Superman"
    case GreenLantern = "Green Lantern"
    case Batman = "Batman"
    case CaptainAmerica = "Captain America"
    
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
