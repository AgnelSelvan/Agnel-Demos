//
//  Modules.swift
//  Agnel Demos
//
//  Created by Neosoft on 06/12/21.
//

import Foundation
import UIKit

struct Modules{
    var title: String
    var chapters: Int
    var completedChapters: Int
    var color: UIColor
    var image: String
    
    static var getAllData: [Modules] = {
        return [
            Modules(title: "Wellness", chapters: 19, completedChapters: 3, color: .orange, image: "bolt.heart"),
            Modules(title: "Mission Self", chapters: 14, completedChapters: 5, color: .blue, image: "person"),
            Modules(title: "Wisdom Bites", chapters: 4, completedChapters: 2, color: .green, image: "brain"),
            Modules(title: "Financial Fitness", chapters: 13, completedChapters: 0, color: .red, image: "rectangle.inset.topright.filled"),
            Modules(title: "Must Read Books", chapters: 24, completedChapters: 1, color: .systemBlue, image: "books.vertical"),
            Modules(title: "Must Learn Skills", chapters: 5, completedChapters: 3, color: .systemOrange, image: "network"),
            
            
        
        ]
    }()
}
