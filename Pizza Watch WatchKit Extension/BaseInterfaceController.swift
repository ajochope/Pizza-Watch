//
//  BaseInterfaceController.swift
//  PizzaCreatorWatch
//
//  Created by Óscar Calles Sáez on 16/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import WatchKit
import Foundation


class BaseInterfaceController: WKInterfaceController {
    var aPizza:Pizza!
    var arrayBases:[(String, String)] =
    [("Base 'XS'", "Delgada"),
     ("Base 'S'", "Crujiente"),
     ("Base 'L'", "Gruesa")]
    
    @IBOutlet var pickerBase: WKInterfacePicker!

    @IBOutlet var buttonBase: WKInterfaceButton!
    
    private func checkIngredientsPizza() {
        if aPizza.base==""{
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
            message: "Please, select a pizza dough",
            preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert,
            actions: [cancel, action])
    }
    
    @IBAction func buttonBasePressed() {
        checkIngredientsPizza()
        pushControllerWithName("identifyCheesePizza", context: aPizza)
    }
    
    @IBAction func pickerBaseAction(value: Int) {
        let selection=arrayBases[value].1
        aPizza.base=selection
        buttonBase.setTitle(selection)
       // NSLog("Bases Picker: \(selection) selected")
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
        
        buttonBase.setBackgroundImageNamed("PizzaBase")
        
        let pickerItems: [WKPickerItem] = arrayBases.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerBase.setItems(pickerItems)
        //        pickerSize.focus()
        //        pickerSize.setEnabled(true)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
