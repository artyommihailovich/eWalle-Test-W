//
//  UI.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/16/21.
//

import UIKit

struct UI {
    
    public enum FontWeight: String {
        case logoMedium = "Ubuntu-Medium"
        case regular = "Avenir-Medium"
        case bold = "Avenir-Heavy"
        case thin = "Avenir-Light"
        
    }

    public enum FontSize: CGFloat {
        case logo = 28
        case logoHorizontal = 25
        case subDate = 13
        case button = 16
        case number = 24
        case text = 14
        case subTitle = 17
        case small = 10
    }
    
    struct Images {
        static let cover = UIImage(named: "LeftCover")
        static let logo = UIImage(named: "Logo")
    }
    
    struct WeatherIcons {
        static let cloudFill = UIImage(systemName: "cloud.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .light))?.withRenderingMode(.alwaysOriginal).withTintColor(.orangeCustom)
    }
    
    struct Avatars {
        static let ashley = UIImage(named: "Ashley")!
        static let joseph = UIImage(named: "Joseph")!
        static let mike = UIImage(named: "Mike")!
        static let carol = UIImage(named: "Carol")!
    }
    
    struct ButtonIcons {
        static let menu = UIImage(named: "menuButton")
        static let plus = UIImage(named: "plusButton")
        static let qr = UIImage(named: "qrButton")
        static let filter = UIImage(named: "filterButton")
        static let closeButton = UIImage(named: "closeButton")
        static let logout = UIImage(systemName: "power", withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withRenderingMode(.alwaysOriginal)
    }
    
    struct ServicesIcons {
        static let sendMoney =  UIImage(named: "sendMoney")!
        static let receiveMoney = UIImage(named: "receiveMoney")!
        static let mobilePrepaid = UIImage(named: "mobilePrepaid")!
        static let electricityBill = UIImage(named: "electricityBill")!
        static let cashbackOffer = UIImage(named: "cashbackOffer")!
        static let movieTickets = UIImage(named: "movieTickets")!
        static let flightTickets = UIImage(named: "flightTickets")!
        static let moreOptions = UIImage(named: "moreOptions")!
    }
}
