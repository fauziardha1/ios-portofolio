//
//  HomePresenter.swift
//  bangunin
//
//  Created by Fauzi Arda on 10/07/23.
//

import Foundation

class HomePresenter: HomePresentationLogic {
    weak var controller: HomeViewController?
    
    func setFirstViewOfMap() {
        controller?.displayFirstViewOfMap()
    }
    
    func updateCurrentLocation() {
        controller?.updateCurrentLocation()
    }
    
    func displayCurrentLocationNotation() {
        controller?.displayCurrentLocationNotation()
    }
    
}

