//
//  IngredientsInterfaceController.swift
//  PizzaCreatorWatch
//
//  Created by Óscar Calles Sáez on 16/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import WatchKit
import Foundation


class IngredientsInterfaceController: WKInterfaceController {
    var ingredient:String=""
    var counter=5
    var aPizza:Pizza!
    var arrayLocal:[String] = []
    var arrayIngredients:[(String, String)] =
    [("Vegatables", "Pimiento"),
     ("Vegatables", "Cebolla"),
     ("Vegatables", "Aceituna"),
     ("Fruit", "Piña"),
     ("Meat", "Jamón"),
     ("Meat", "Pepperoni"),
     ("Meat", "Pavo"),
     ("Meat", "Salchicha"),
     ("Fish", "Anchoa"),
     ("Cheese", "Doble queso")]

    @IBOutlet var labelIngredients: WKInterfaceLabel!
    @IBOutlet var pickerIngredients: WKInterfacePicker!
    @IBOutlet var buttonAdd: WKInterfaceButton!
    @IBOutlet var buttonIngredients: WKInterfaceButton!
    
    @IBAction func buttonAddPressed() {
        counter--
        labelIngredients.setText(counter.description)
        if ingredient==""{
            showAlertPressed()
        } else {
            buttonAdd.setTitle("+")
            arrayLocal.append(ingredient)
        }
        if counter == 0{
            buttonAdd.setEnabled(false)
            labelIngredients.setText("0")
            pickerIngredients.setEnabled(false)
        }
    }
 
    @IBAction func buttonIngredientsPressed() {
        checkIngredientsPizza()
        aPizza.arrayIngredientsSelected=arrayLocal
        pushControllerWithName("identifyConfirmationPizza", context: aPizza)
    }
    
    @IBAction func pickerIngredientsAction(value: Int) {
        ingredient=arrayIngredients[value].1
        buttonAdd.setTitle(ingredient)
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let c=context as! Pizza
        aPizza=c
        arrayLocal = []
        // Configure interface objects here.
    }
    
    private func checkIngredientsPizza() {
        let dim=arrayLocal.count
        for var i=0; i<5; i++ {
            if dim<i+1{
                arrayLocal.append("NOT SELECTED")
            }
        }
    }
    
    @IBAction func showAlertPressed() {
        let cancel = WKAlertAction(title: "Cancel",
            style: WKAlertActionStyle.Cancel,
            handler: { () -> Void in /*self.arrayLocal=[]*/}
        )
        let action = WKAlertAction(title: "OK",
            style: WKAlertActionStyle.Default,
            handler: { () -> Void in /*self.arrayLocal=[]*/}
        )
        self.presentAlertControllerWithTitle("Alert",
            message: "Please, check you pizza ingredients",
            preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert,
            actions: [cancel, action])
    }
    
    private func loadPicker() {
        let pickerItems: [WKPickerItem] = arrayIngredients.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.1
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerIngredients.setItems(pickerItems)
        //        pickerSize.focus()
        //        pickerSize.setEnabled(true)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        buttonAdd.setEnabled(true)
        counter=5
        arrayLocal=[]
        pickerIngredients.setEnabled(true)
        buttonIngredients.setBackgroundImageNamed("PizzaIngre")
        buttonAdd.setBackgroundImageNamed("AddIngre")
        labelIngredients.setText(counter.description)
        loadPicker()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}
