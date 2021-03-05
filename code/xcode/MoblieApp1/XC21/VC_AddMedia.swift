//
//  VC_AddMedia.swift
//  XC21
//
//  Created by Frank Effrim-Botchey on 29/05/2019.
//  Copyright © 2019 myOrganization. All rights reserved.
//

import UIKit

class VC_AddMedia: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    var newZcard1Name: String!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myZcard1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func loadImage(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as?
            UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            print("image is \(pickedImage)")
            newZcard1Name = "ID002"+"zCard1.jpg"
            myZcard1.text = newZcard1Name
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
