//
//  CheeseInterfaceController.swift
//  PizzaCreatorWatch
//
//  Created by Óscar Calles Sáez on 16/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import WatchKit
import Foundation


class CheeseInterfaceController: WKInterfaceController {
    var aPizza:Pizza!
    var arrayCheeses:[(String, String)] =
        [("Cheese 'M'", "Mozzarella"),
        ("Cheese 'C'", "Cheddar"),
        ("Cheese 'P'", "Parmesano"),
        ("No cheese", "NO CHEESE")]
    
    @IBOutlet var pickerCheese: WKInterfacePicker!
    
    @IBOutlet var buttonCheese: WKInterfaceButton!
    
    private func checkIngredientsPizza() {
        if aPizza.cheese==""{
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
            message: "Please, select a pizza cheese",
            preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert,
            actions: [cancel, action])
    }
    
    @IBAction func buttonCheesePressed() {
        checkIngredientsPizza()
        pushControllerWithName("identifyIngredientsPizza", context: aPizza)
    }
    
    @IBAction func pickerCheeseAction(value: Int) {
        let selection=arrayCheeses[value].1
        buttonCheese.setTitle(selection)
        aPizza.cheese=selection
        //NSLog("Cheeses Picker: \(selection) selected")
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let c=context as! Pizza
        aPizza=c

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        buttonCheese.setBackgroundImageNamed("PizzaCheese")
        
        let pickerItems: [WKPickerItem] = arrayCheeses.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerCheese.setItems(pickerItems)
        //        pickerSize.focus()
        //        pickerSize.setEnabled(true)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
