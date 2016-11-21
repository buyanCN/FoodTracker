//
//  MealViewController.swift
//  FoodTracker
//
//  Created by buyan on 15/11/2016.
//  Copyright © 2016 buyan. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    //MARK: properties
    var meal :Meal?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    //@IBOutlet weak var buttonText: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate=self
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    //MARK: UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func checkValidMealName(){
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        dismiss(animated: true, completion:nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton === sender as AnyObject?{
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            meal = Meal(name:name, photo:photo, rating:rating)
        }
    }
    
    //MARK: action
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    

}

