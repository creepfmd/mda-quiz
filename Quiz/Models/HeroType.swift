//
//  HeroType.swift
//  Quiz
//
//  Created by Сергей on 11.11.2020.
//

import UIKit

enum HeroType: String {
    case Superman = "Супермэн"
    case GreenLantern = "Зеленый Фонарь"
    case Batman = "Бэтмэн"
    case CaptainAmerica = "Капитан Америка"
    
    var image: UIImage {
        switch self {
        case .Superman:
            return UIImage(named: "Superman")!
        case .GreenLantern:
            return UIImage(named: "GreenLantern")!
        case .Batman:
            return UIImage(named: "Batman")!
        case .CaptainAmerica:
            return UIImage(named: "CaptainAmerica")!
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
