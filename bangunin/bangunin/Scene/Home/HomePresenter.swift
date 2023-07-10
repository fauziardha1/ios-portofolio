//
//  HomePresenter.swift
//  bangunin
//
//  Created by Fauzi Arda on 10/07/23.
//

import Foundation

protocol HomePresentationLogic {
    var controller: HomeViewController? { get set }
    func setFirstViewOfMap()
    func updateCurrentLocation()
    func displayCurrentLocationNotation()
}


