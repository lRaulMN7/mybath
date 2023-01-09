//
//  ConversionCell.swift
//  mybath
//
//  Created by Raul Telo Sanchez on 9/1/23.
//

import Foundation
import UIKit

class ConversionCell: UICollectionViewCell {
    // Declare a delegate property
    var delegate: CurrencyCollectionViewCellDelegate?
    
    // Declare a text field to display the integer value
    let valueTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    // Initialize the cell with a currency code
    func setup(with currencyCode: String) {
        valueTextField.placeholder = currencyCode
        
        // Add the text field to the cell's content view
        contentView.addSubview(valueTextField)
        
        // Set up the text field's constraints
        valueTextField.translatesAutoresizingMaskIntoConstraints = false
        valueTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        valueTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        // Add a target for the text field's "Editing Changed" event
        valueTextField.addTarget(self, action: #selector(valueChanged), for: .editingChanged)
    }
    
    // This function is called when the value in the text field is changed
    @objc func valueChanged() {
        // Notify the delegate that the value has changed
        delegate?.currencyValueChanged(self)
    }
}

// Declare a protocol for the cell's delegate
protocol CurrencyCollectionViewCellDelegate {
    func currencyValueChanged(_ cell: ConversionCell)
}

