//
//  ConfirmationInterfaceController.swift
//  PizzaCreatorWatch
//
//  Created by Óscar Calles Sáez on 16/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmationInterfaceController: WKInterfaceController {
    var aPizza:Pizza!
    var arrayOrder:[(String, String)]=[]
    
    @IBOutlet var pickerOrder: WKInterfacePicker!
    @IBOutlet var buttonOrder: WKInterfaceButton!
    
    @IBAction func buttonOrderPressed() {
        buttonOrder.setBackgroundImageNamed("PizzaOrder")
        buttonOrder.setTitle("Working...")
        arrayOrder=[("Size", ""),
            ("Base", ""),
            ("Cheese", ""),
            ("Ingredient 1", ""),
            ("Ingredient 2", ""),
            ("Ingredient 3", ""),
            ("Ingredient 4", ""),
            ("Ingredient 5", "")]
        loadPicker()
        pickerOrder.setEnabled(false)
    }
    
    @IBAction func pickerOrderAction(value: Int) {
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
                                            message: "Please, check you pizza",
                                        preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert,
                                actions: [cancel, action])
    }
    
    private func loadIngredientsPizza() {
            arrayOrder=[("Size", aPizza.size),
                ("Base", aPizza.base),
                ("Cheese", aPizza.cheese),
                ("Ingredient 1", aPizza.arrayIngredientsSelected[0]),
                ("Ingredient 2", aPizza.arrayIngredientsSelected[1]),
                ("Ingredient 3", aPizza.arrayIngredientsSelected[2]),
                ("Ingredient 4", aPizza.arrayIngredientsSelected[3]),
                ("Ingredient 5", aPizza.arrayIngredientsSelected[4])]
    }
    
    private func loadPicker() {
        let pickerItems: [WKPickerItem] = arrayOrder.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerOrder.setItems(pickerItems)
        //        pickerSize.focus()
        //        pickerSize.setEnabled(true)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let c=context as! Pizza
        aPizza=c
        loadIngredientsPizza()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        pickerOrder.setEnabled(true)
        buttonOrder.setBackgroundImageNamed("PizzaFinish")
        loadPicker()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
