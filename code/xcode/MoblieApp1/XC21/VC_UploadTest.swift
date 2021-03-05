//
//  VC_UploadTest.swift
//  XC21
//
//  Created by Frank Effrim-Botchey on 03/06/2019.
//  Copyright © 2019 myOrganization. All rights reserved.
//

import UIKit
import AWSCore
import AWSS3

class VC_UploadTest: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        myImagePicker.delegate = self
    }

   
    @IBOutlet weak var img: UIImageView!
    
    var myImagePicker = UIImagePickerController()
    
    @IBAction func onClickPickImage(_ sender: Any) {
        myImagePicker.sourceType = .photoLibrary
        myImagePicker.allowsEditing = true
        present(myImagePicker, animated: true, completion: nil)
        
        
    }
}

//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       // if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
          //  img.image = image
        //}
//        dismiss(animated: true, completion: nil)
//    }
//}
