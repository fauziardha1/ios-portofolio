//
//  MainListViewController.swift
//  LackTraining
//
//  Created by User on 26/09/23.
//

import Foundation
import UIKit

class MainListViewController: UICollectionViewController {
    var datasource: DataSource!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // cell registration
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        datasource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map{ $0.title })
        
        datasource.apply(snapshot)
        
        collectionView.dataSource = datasource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

extension MainListViewController {
    typealias DiffableDataSource = UICollectionViewDiffableDataSource<Int, String>
    
    func makeDataSource() -> DiffableDataSource {
        let reminderCellRegistration = reminderCellRegistration()
        
        return DiffableDataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: reminderCellRegistration, for: indexPath, item: itemIdentifier)
        }
    }
    
    func reminderCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, String> {
        UICollectionView.CellRegistration<UICollectionViewListCell, String>(handler: cellRegistrationHandler(cell:indexPath:id:))
    }
}
