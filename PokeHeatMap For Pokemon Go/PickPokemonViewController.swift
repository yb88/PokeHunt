//
//  PickPokemonViewController.swift
//  PokeHeatMap For Pokemon Go
//
//  Created by youcef bouhafna on 7/20/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import UIKit

class PickPokemonViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pokemonArray: [String] = []

    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancel(sender: AnyObject) {
    }
    @IBAction func sendLocation(sender: AnyObject) {
    }
    
    // MARK: - Picker View Data Source Functions
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pokemonArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pokemonArray[row]
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
