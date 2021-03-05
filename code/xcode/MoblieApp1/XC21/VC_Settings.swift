//
//  VC_Settings.swift
//  XC21
//
//  Created by Frank Effrim-Botchey on 18/06/2019.
//  Copyright © 2019 myOrganization. All rights reserved.
//

import UIKit

class VC_Settings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func clearMemoryBtn(_ sender: Any) {
        print("********* clearMemoryBtn:   Button Pressed.*********")
        FileManager.default.clearTmpDirectory()
        print("********* clearMemoryBtn:   Memory has been cleared.*********")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

extension FileManager {
    func clearTmpDirectory() {
        do {
            let tmpDirURL = FileManager.default.temporaryDirectory
            let tmpDirectory = try contentsOfDirectory(atPath: tmpDirURL.path)
            try tmpDirectory.forEach { file in
                let fileUrl = tmpDirURL.appendingPathComponent(file)
                try removeItem(atPath: fileUrl.path)
            }
        } catch {
            //catch the error somehow
        }
    }
}
