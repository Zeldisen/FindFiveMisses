//
//  FiveViewModel.swift
//  FindFiveMisses
//
//  Created by Jeanette Norberg on 2025-04-23.
//

import Foundation
import SwiftUI

struct WrongZone {
    let x: CGFloat
    let y: CGFloat
    let radius: CGFloat
}

class FiveViewModel: ObservableObject {
    
    @Published var wrongZones: [WrongZone] = [
        WrongZone(x: 120, y: 300, radius: 30),
        WrongZone(x: 250, y: 150, radius: 25),
       
    ]
    
    func checkPress(point: CGPoint) -> Bool {
        for WrongZone in wrongZones {
                let dx = point.x - WrongZone.x
                let dy = point.y - WrongZone.y
                let distance = sqrt(dx*dx + dy*dy)
                if distance <= WrongZone.radius {
                  
                    return true
                }
            }
            return false
    }

}
