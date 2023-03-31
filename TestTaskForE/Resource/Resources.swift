//
//  Resources.swift
//  TestTaskForE
//
//  Created by Даниил Мухсинятов on 13.03.2023.
//

import Foundation
import UIKit
import SwiftUI

enum R {
    enum Colors {
        static let background = Color(hexString: "#FAF9FF")
        static let textBlack = Color(hexString: "#000000")
        static let textPlaceholder = Color(hexString: "#7B7B7B")
        static let textButtonWhite = Color(hexString: "#EAEAEA")
        static let buttonViolet = Color(hexString: "#4E55D7")
        static let backgroundTextField = Color(hexString: "#E8E8E8")
        
        enum Profile {
            static let fullName = Color(hexString: "#3F3F3F")
            static let border = Color(hexString: "#C0C0C0")
        }
        
        enum CellElements {
            static let textWhite = Color(hexString: "#FFFFFF")
            static let textBlack = Color(hexString: "#070604")
            static let red = Color(hexString: "#F93A3A")
            static let grey = Color(hexString: "#C4C4C4")
            static let button = Color(hexString: "#E5E9EF")
            static let border = Color(hexString: "#B9B9B9")
        }
        
        enum TabBar {
            static let button = Color(hexString: "#909090")
            static let background = Color(hexString: "#FFFFFF")
        }
        
        enum Page2 {
            static let button = Color(hexString: "#545589")
            static let backgroundButtons = Color(hexString: "#E5E9EF")
            static let border = Color(hexString: "#EBEBEB")
            static let description = Color(hexString: "#808080")
            static let textColor = Color(hexString: "#737373")
            static let borderColor = Color(hexString: "#ADADAD")
            static let backgroundProductSelection = Color(hexString: "#181726")
            static let textAddToCardButton = Color(hexString: "#99A0FF")
        }
    }
    
    enum Images {
        enum SignIn {
            static let google = UIImage(named:"googleImage")!
            static let apple = UIImage(named:"appleImage")!
        }
        
        enum Login {
            static let eye = UIImage(named:"eye")!
        }
        
        enum Profile {
            static let profile = UIImage(named:"profile")!
            static let card = UIImage(named:"card")!
            static let restore = UIImage(named:"restore")!
            static let help = UIImage(named:"help")!
            static let logOut = UIImage(named:"logOut")!
            static let uploadButton = UIImage(named:"uploadButton")!
            static let rightArrow = UIImage(named:"rightArrow")!
            static let leftArrow = UIImage(named:"leftArrow")!
        }
        
        enum CellElements {
            static let plus = UIImage(named:"plus")!
            static let heart = UIImage(named:"heart1")!
            static let logo = UIImage(named:"logo")!
            
        }
        
        enum Page1 {
            static let arrovDown = UIImage(named:"arrovDown")!
            static let hamburger = UIImage(named:"hamburger")!
            static let phones = UIImage(named:"phones")!
            static let headphones = UIImage(named:"headphones")!
            static let games = UIImage(named:"games")!
            static let cars = UIImage(named:"cars")!
            static let furniture = UIImage(named:"furniture")!
            static let kids = UIImage(named:"kids")!
            static let magnifier = UIImage(named:"magnifier")!
            static let arrayTagImageLeft = [phones,headphones]
            static let arrayTagImageCenter = [games,cars]
            static let arrayTagImageRight = [furniture,kids]
        }
        
        enum Page2 {
            static let heard = UIImage(named:"heardP2")!
            static let leftArrow = UIImage(named:"leftArrowP2")!
            static let share = UIImage(named:"share")!
            static let star = UIImage(named:"star")!
            static let testImage = UIImage(named:"testImage")!
        }
    }
    
    enum Strings {
        enum SignIn {
            static let title = "Sign in"
            static let firstName = "First name"
            static let lastName = "Last name"
            static let email = "Email"
            static let thereIsAnAccount = "Already have an account?"
            static let loginButton = "Log in"
            static let google = "Sign in with Google"
            static let apple = "Sign in with Apple"
        }
        
        enum Login {
            static let title = "Welcome back"
            static let firstName = "First name"
            static let password = "Password"
            static let loginButton = "Login"
        }
        
        enum Profile {
            static let title = "Profile"
            static let changePhoto = "Change photo"
            static let fullName = "Satria Adhi Pradana"
            static let uploadButton = "Upload item"
            static let tradeStore = "Trade store"
            static let paymentMethod = "Payment method"
            static let balance = "Balance"
            static let tradeHistory = "Trade history"
            static let restorePurchase = "Restore purchase"
            static let help = "Help"
            static let logOut = "Log out"
        }
        
        enum Page1 {
            static let titleFirstElement = "Trade by"
            static let titleSecondElement = "bata"
            static let location = "Location"
            static let searchBar = "What are you looking for ?"
            static let phones = "Phones"
            static let headphones = "Headphones"
            static let games = "Games"
            static let cars = "Cars"
            static let furniture = "Furniture"
            static let kids = "Kids"
            static let viewAll = "View all"
            static let latest = "Latest deals"
            static let flashSale = "Flash Sale"
            static let brands = "Brands"
            static let arrayTagTextLeft = [phones,headphones]
            static let arrayTagTextCenter = [games,cars]
            static let arrayTagTextRight = [furniture,kids]
        }
        
        enum Page2 {
            static let color = "Color:"
            static let quantity = "Quantity:"
            static let addToCard = "ADD TO CART"
        }
    }
    
    enum Fonts {
        enum isBold {
            case regular, medium, semiBold, bold
        }
        static func montserrat(with size: CGFloat,_ bold: isBold = .regular) -> Font {
            
            switch bold {
            case .regular:
                return Font.custom("Montserrat-Regular", size: size)
            case .semiBold:
                return Font.custom("Montserrat-SemiBold", size: size)
            case .bold:
                return Font.custom("Montserrat-Bold", size: size)
            case .medium:
                return Font.custom("Montserrat-Medium", size: size)
            }
        }
    }
}





