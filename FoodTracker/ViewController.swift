//
//  ViewController.swift
//  FoodTracker
//
//  Created by Basys on 8/22/15.
//  Copyright (c) 2015 Basys. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLable: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view.backgroundColor = UIColor.blueColor()
        nameTextField.delegate = self
    }

    // MARK: Actions
    
    @IBAction func selectPhotoFromImageLibrary(sender: UITapGestureRecognizer) {
        println("tap tap")
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    // MARK: UITextField Delegates
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        mealNameLable.text = nameTextField.text
        return true
    }
    
    // MARK: UIImagePickerController Delegates
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("Selection cancelled")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        println("Selection OK")
        let selectedImage = info [UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
}

