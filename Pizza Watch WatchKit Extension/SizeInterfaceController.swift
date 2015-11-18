//
//  SizeInterfaceController.swift
//  PizzaCreatorWatch
//
//  Created by Óscar Calles Sáez on 16/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import WatchKit
import Foundation


class SizeInterfaceController: WKInterfaceController {
    
    var aPizza:Pizza = Pizza()
    var arraySizes:[(String, String)] =
       [("Size 'M'", "Pequeña"),
        ("Size 'L'", "Mediana"),
        ("Size 'XL'", "Grande")]

    @IBOutlet var buttonSize: WKInterfaceButton!
    @IBOutlet var pickerSize: WKInterfacePicker!
    
    private func checkIngredientsPizza() {
        if aPizza.size==""{
            showAlertPressed()
        }
    }
    
    @IBAction func showAlertPressed() {
        let cancel = WKAlertAction(title: "Cancel",
            style: WKAlertActionStyle.Cancel,
            handler: { () -> Void in}
        )
        let action = WKAlertAction(title: "OK",
            style: WKAlertActionStyle.Default,
            handler: { () -> Void in}
        )
        self.presentAlertControllerWithTitle("Alert",
            message: "Please, select a pizza size",
            preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert,
            actions: [cancel, action])
    }
    
    @IBAction func pickerSizeAction(value: Int) {
        let selection=arraySizes[value].1
        aPizza.size=selection
        buttonSize.setTitle(selection)
        //NSLog("Sizes Picker: \(selection) selected")
    }
    
    @IBAction func buttonSizePressed() {
        checkIngredientsPizza()
        pushControllerWithName("identifyBasePizza", context: aPizza)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        buttonSize.setBackgroundImageNamed("PizzaSize")
        
        let pickerItems: [WKPickerItem] = arraySizes.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerSize.setItems(pickerItems)
//        pickerSize.focus()
//        pickerSize.setEnabled(true)

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
