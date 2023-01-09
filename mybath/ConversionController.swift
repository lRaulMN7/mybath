//
//  ConversionController.swift
//  mybath
//
//  Created by Raul Telo Sanchez on 9/1/23.
//

import Foundation
import UIKit

class ConversionController: UIViewController, UICollectionViewDataSource, CurrencyCollectionViewCellDelegate {
    // Declare a collection view and an array of currency codes
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the cell class and its reuse identifier
        collectionView.register(ConversionCell.self, forCellWithReuseIdentifier: "CurrencyCell")
        
        // Set the collection view's data source
        collectionView.dataSource = self
        
        // Add the collection view to the view hierarchy
        view.addSubview(collectionView)
        
        // Set up the collection view's constraints
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    let currencyCodes = ["EUR", "THB"]
    let offlineConversionRates: [String: Double] = ["EUR": 0.028, "THB": 35.93 ]
    
    // Implement the "numberOfItemsInSection" method to return the number of currencies
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currencyCodes.count
    }
    
    // Implement the "cellForItemAt" method to dequeue a cell and set it up with a currency code
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrencyCell", for: indexPath) as! ConversionCell
        cell.setup(with: currencyCodes[indexPath.item])
        cell.delegate = self
        return cell
    }

    // This method is called when the value in a cell is changed
    func currencyValueChanged(_ cell: ConversionCell) {
        // Get the index path for the cell
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        
        // Get the value from the text field
        guard let value = Double(cell.valueTextField.text!) else { return }
        
        // Update the values in the other cells
        for i in 0..<currencyCodes.count {
            if i != indexPath.item {
                // Get the cell at the current index
                let otherCell = collectionView.cellForItem(at: IndexPath(item: i, section: 0)) as! ConversionCell
                
                // Multiply the value in the cell by the conversion rate and update the text field
                if let conversionRate = offlineConversionRates[currencyCodes[i]] {
                    otherCell.valueTextField.text = "\(value * conversionRate)"
                }
            }
        }
    }
    
}
