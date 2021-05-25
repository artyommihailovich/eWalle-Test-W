//
//  SecondModel.swift
//  StartAppSnp
//
//  Created by Artyom Mihailovich on 4/19/21.
//

import Foundation
import UIKit

final class MainModel {
    
    private(set) lazy var currentBalance: BalanceData = {
        BalanceData(balance: 20.600)
    }()
    
    var users: [UserData] {
        [UserData(name: "Joseph", image: UI.Avatars.joseph.pngData()!),
         UserData(name: "Mike", image: UI.Avatars.mike.pngData()!),
         UserData(name: "Ashley", image: UI.Avatars.ashley.pngData()!)
        ]
    }
    
    var services: [ServicesDataLite] {
        [ServicesDataLite(title: "Send \nMoney", image: UI.ServicesIcons.sendMoney.pngData()!),
         ServicesDataLite(title: "Receive \nMoney", image: UI.ServicesIcons.receiveMoney.pngData()!),
         ServicesDataLite(title: "Mobile \nPrepaid", image: UI.ServicesIcons.mobilePrepaid.pngData()!),
         ServicesDataLite(title: "Electricity \nBill", image: UI.ServicesIcons.electricityBill.pngData()!),
         ServicesDataLite(title: "Cashback \nOffer", image: UI.ServicesIcons.cashbackOffer.pngData()!),
         ServicesDataLite(title: "Movie \nTickets", image: UI.ServicesIcons.movieTickets.pngData()!),
         ServicesDataLite(title: "Flight \nTickets", image: UI.ServicesIcons.flightTickets.pngData()!),
         ServicesDataLite(title: "More \nOptions", image: UI.ServicesIcons.moreOptions.pngData()!)
        ]
    }
    
    var currentUser: MenuUserData {
        MenuUserData(name: "Carol Black",
                 image: UI.Avatars.carol.pngData()!,
                 city: "Seattle, Washington")
    }
    
    var developData: DevelopData {
        DevelopData(version: "2.0.1")
    }
}
