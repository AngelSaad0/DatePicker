//
//  ViewController.swift
//  DatePicker
//
//  Created by Engy on 11/3/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var displayTextField: UITextField!

    // MARK: - Properties
    private let datePicker = UIDatePicker()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()

        // Set the preferred date picker style
        datePicker.preferredDatePickerStyle = .wheels
    }

    // MARK: - Setup Methods
    private func setupDatePicker() {
        // Create and configure a toolbar with Done and Cancel buttons
        let toolBar = UIToolbar()
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClicked))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonClicked))
        cancelButton.tintColor = .gray
        toolBar.setItems([doneButton, cancelButton], animated: true)

        // Set the toolbar as the accessory view of the text field
        displayTextField.inputAccessoryView = toolBar

        // Set the UIDatePicker as the input view of the text field
        displayTextField.inputView = datePicker

        // Set the date picker mode to display only dates
        datePicker.datePickerMode = .date
    }

    // MARK: - Actions
    @objc private func doneButtonClicked() {
        // Configure the date formatter to display the selected date in a readable format
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none

        // Update the text field with the selected date and dismiss the date picker
        displayTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }

    @objc private func cancelButtonClicked() {
        // Dismiss the date picker without saving changes
        displayTextField.resignFirstResponder()
    }
}
