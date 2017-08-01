//
//  ViewController.swift
//  Eshara2
//
//  Created by Tamara Nagui on 7/31/17.
//  Copyright © 2017 Tamara Nagui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var pickedImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cameraBtn(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    @IBAction func goToListOfWords(_ sender: UIButton) {
    }
    @IBAction func saveBtn(_ sender: UIButton) {
        
        let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        let compressedJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPEGImage!, nil, nil, nil)
        saveAlert()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo:  [NSObject : AnyObject]!)
    {
        pickedImage.image = image
        self.dismiss (animated: true, completion: nil);
    }
    
    func saveAlert()
    {
        let alertController = UIAlertController(title: "Image Saved!", message: "Your picture was successfully saved!", preferredStyle : .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        present(alertController, animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
        
    }

}

