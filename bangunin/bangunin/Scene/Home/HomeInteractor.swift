//
//  HomeInteractor.swift
//  bangunin
//
//  Created by Fauzi Arda on 06/07/23.
//

import Foundation

class HomeInteractor: HomeBusinessLogic {
    weak var presenter: HomePresentationLogic?
    
    func getCurrentLocation() {
        presenter?.updateCurrentLocation()
    }
    
    func setNewAnnotation() {
        // do something
        presenter?.displayCurrentLocationNotation()
    }
    
    
}
