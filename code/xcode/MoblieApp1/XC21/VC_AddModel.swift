//
//  VC_AddModel.swift
//  XC21
//
//  Created by Frank Effrim-Botchey on 30/05/2019.
//  Copyright © 2019 myOrganization. All rights reserved.
//

import UIKit
import AWSCore
import AWSDynamoDB
import Foundation
import AVKit
import AWSAuthCore
import AWSAuthUI
import AWSS3

var globalFileURL = URL (string: "https://www.apple.com")
var globalFileType = ".XXX"
var globalMediaType = "BLANK"

var videoURL: NSURL?

class VC_AddModel: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    
    
    let bucketName = "xc902"
    var contentUrl: URL!
    var s3Url: URL!
    var myImagePicker = UIImagePickerController()
    var mainImageURL = URL(string: "https://www.apple.com")
    let myHeight = ["169","170","171","172","173","174","175","176","178","179","180","181","182","183","184","185","186"]
    let imagePicker = UIImagePickerController()
    var input_Height = 176
    var input_Hips  = 33
    var input_Waist  = 28
    var input_Chest = 34
    var input_UKSize = 8
    var input_Shoe = 6
    var duplicateIDResult = "yyy"
    
    
    
  //setup text fields

    @IBOutlet weak var input_Country: UITextField!
    @IBOutlet weak var input_UserID: UITextField!
    @IBOutlet weak var input_City: UITextField!
    @IBOutlet weak var input_Intention: UITextField!
    
    
    @IBOutlet weak var label_Height: UILabel!
    @IBOutlet weak var label_Hips: UILabel!
    @IBOutlet weak var label_Waist: UILabel!
    @IBOutlet weak var label_Chest: UILabel!
    @IBOutlet weak var label_UKSize: UILabel!
    @IBOutlet weak var label_Shoe: UILabel!

    
    @IBAction func slider_Hips(_ sender: UISlider) {
        label_Hips.text = String(Int(sender.value))
        input_Hips = Int(sender.value)
    }
    @IBAction func slider_Waist(_ sender: UISlider) {
        label_Waist.text = String(Int(sender.value))
        input_Waist = Int(sender.value)
    }
    @IBAction func slider_Height(_ sender: UISlider) {
        label_Height.text = String(Int(sender.value))
        input_Height = Int(sender.value)
    }
    @IBAction func slider_Chest(_ sender: UISlider) {
        label_Chest.text = String(Int(sender.value))
        input_Chest = Int(sender.value)
    }
    @IBAction func slider_Shoe(_ sender: UISlider) {
        label_Shoe.text = String(Int(sender.value))
        input_Shoe = Int(sender.value)
    }
    @IBAction func slider_UKSize(_ sender: UISlider) {
        label_UKSize.text = String(Int(sender.value))
        input_UKSize = Int(sender.value)
    }


    @IBOutlet weak var _Firstname: UITextField!
    @IBOutlet weak var _Surname: UITextField!
    @IBOutlet weak var _Mobile: UITextField!
    @IBOutlet weak var _Email: UITextField!
    @IBOutlet weak var _SML: UITextField!
    @IBOutlet weak var _Eyes: UITextField!
    @IBOutlet weak var _Twin: UITextField!
    @IBOutlet weak var _HairStyle: UITextField!
    @IBOutlet weak var _HairColour: UITextField!
    @IBOutlet weak var filename_Zcard1: UILabel!
    @IBOutlet weak var filename_Zcard2: UILabel!
    @IBOutlet weak var filename_PFront: UILabel!
    @IBOutlet weak var filename_PBack: UILabel!
    @IBOutlet weak var filename_PLSide: UILabel!
    @IBOutlet weak var filename_PRSide: UILabel!
    @IBOutlet weak var filename_PFull: UILabel!
    @IBOutlet weak var filename_VidCatwalk: UILabel!
    @IBOutlet weak var filename_VidHair: UILabel!
    @IBOutlet weak var uploadBtn_Zcard1: UIButton!
    @IBOutlet weak var uploadBtn_Zcard2: UIButton!
    @IBOutlet weak var uploadBtn_PFront: UIButton!
    @IBOutlet weak var uploadBtn_PBack: UIButton!
    @IBOutlet weak var uploadBtn_PLSide: UIButton!
    @IBOutlet weak var uploadBtn_PRSide: UIButton!
    @IBOutlet weak var uploadBtn_PFull: UIButton!
    @IBOutlet weak var uploadBtn_VidCatwalk: UIButton!
    @IBOutlet weak var uploadBtn_VidHair: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideUploadBtns()
        print("********* Viewdidload:              globalFileURL = \(String(describing: globalFileURL))*********")
        print("********* Viewdidload:              globalFileType = \(String(describing: globalFileType))*********")
        print("********* Viewdidload:              globalMediaType = \(String(describing: globalMediaType))*********")
        // cognito - for upload
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.EUWest1,
                                                                identityPoolId:"eu-west-1:56528c7d-a3f8-4151-87dd-fea02fb307f7")
        let configuration = AWSServiceConfiguration(region:.EUWest1, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        s3Url = AWSS3.default().configuration.endpoint.url

        myImagePicker.delegate = self
        // set border on labels
        input_Country.borderStyle = UITextBorderStyle.roundedRect
        input_UserID.layer.borderWidth = 0.30
        input_UserID.borderStyle = UITextBorderStyle.roundedRect
        input_City.borderStyle = UITextBorderStyle.roundedRect
        input_Intention.borderStyle = UITextBorderStyle.roundedRect
        
        
        _Firstname.borderStyle = UITextBorderStyle.roundedRect
        _Surname.borderStyle = UITextBorderStyle.roundedRect
        _Mobile.borderStyle = UITextBorderStyle.roundedRect
        _Email.borderStyle = UITextBorderStyle.roundedRect
//        _Waist.borderStyle = UITextBorderStyle.roundedRect
//        _UKSize.borderStyle = UITextBorderStyle.roundedRect
        _SML.borderStyle = UITextBorderStyle.roundedRect
        _Eyes.borderStyle = UITextBorderStyle.roundedRect
//        _ShoeSize.borderStyle = UITextBorderStyle.roundedRect
        _Twin.borderStyle = UITextBorderStyle.roundedRect
        _HairStyle.borderStyle = UITextBorderStyle.roundedRect
        _HairColour.borderStyle = UITextBorderStyle.roundedRect
        filename_Zcard1.layer.borderWidth = 0.10
        filename_Zcard1.layer.cornerRadius = 4
        filename_Zcard2.layer.borderWidth = 0.10
        filename_Zcard2.layer.cornerRadius = 4
        filename_PFront.layer.borderWidth = 0.10
        filename_PFront.layer.cornerRadius = 4
        filename_PBack.layer.borderWidth = 0.10
        filename_PBack.layer.cornerRadius = 4
        filename_PLSide.layer.borderWidth = 0.10
        filename_PLSide.layer.cornerRadius = 4
        filename_PRSide.layer.borderWidth = 0.10
        filename_PRSide.layer.cornerRadius = 4
        filename_PFull.layer.borderWidth = 0.10
        filename_PFull.layer.cornerRadius = 4
        filename_VidCatwalk.layer.borderWidth = 0.10
        filename_VidCatwalk.layer.cornerRadius = 4
        filename_VidHair.layer.borderWidth = 0.10
        filename_VidHair.layer.cornerRadius = 4
        
        label_Hips.layer.borderWidth = 0.10
        label_Hips.layer.cornerRadius = 4
        label_Height.layer.borderWidth = 0.10
        label_Height.layer.cornerRadius = 4
    }
    func hideUploadBtns(){
        uploadBtn_Zcard1.isHidden = true
        uploadBtn_Zcard2.isHidden = true
        uploadBtn_PFront.isHidden = true
        uploadBtn_PBack.isHidden = true
        uploadBtn_PLSide.isHidden = true
        uploadBtn_PRSide.isHidden = true
        uploadBtn_PFull.isHidden = true
        uploadBtn_VidCatwalk.isHidden = true
        uploadBtn_VidHair.isHidden = true
        filename_Zcard1.backgroundColor = UIColor.white
        filename_Zcard2.backgroundColor = UIColor.white
        filename_PFront.backgroundColor = UIColor.white
        filename_PBack.backgroundColor = UIColor.white
        filename_PLSide.backgroundColor = UIColor.white
        filename_PRSide.backgroundColor = UIColor.white
        filename_PFull.backgroundColor = UIColor.white
        filename_VidCatwalk.backgroundColor = UIColor.white
        filename_VidHair.backgroundColor = UIColor.white
    }
    func showAlert(alertTitle: String, alertMsg: String) {
        let alertController = UIAlertController(title: alertTitle,
                                                message: alertMsg,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func selectMyImage() {
        myImagePicker.allowsEditing = false
        myImagePicker.sourceType = .photoLibrary
        myImagePicker.mediaTypes = ["public.image", "public.movie"]
        present(myImagePicker, animated: true, completion: nil)
        print ("********* selectMyImage: done *********")
    }
    func createUploadFileName(createFileType: String) -> String {
                return "\(input_UserID.text!)" + "_" + createFileType + "." + globalFileType
    }
    
    
    func checkUpload(fileType2: String) -> String {
        if input_UserID.text == "" {
            showAlert(alertTitle: "UserID Required", alertMsg: "Please enter UserID before uploading.")
            hideUploadBtns()
            return " "
        }else{
            print("*****")
            let uploadFilename = createUploadFileName(createFileType: fileType2)
            print("********* checkUpload:       No Duplicate = \(duplicateIDResult)    uploadFilename      = \(uploadFilename)*")
            uploadImage(uploadFile: uploadFilename)
            hideUploadBtns()
            return uploadFilename
        }
    }
    
    
    
    
   func uploadImage(uploadFile: String!) {
            print("********* uploadImage:          Uploading..... *********")
            let key = "\(uploadFile!)"
            let request = AWSS3TransferManagerUploadRequest()!
            request.bucket = bucketName
            request.key = key
            request.body = globalFileURL!
            request.acl = .publicReadWrite
            print("********* uploadImage:          REQUEST         = \(request)*********")
            let transferManager = AWSS3TransferManager.default()
            transferManager.upload(request).continueWith(executor: AWSExecutor.mainThread()) {
                (task) -> Any? in
                if let error = task.error {
                    print(error)
                }
                if task.result != nil {
                    print("********* uploadImage:          TRANSFERMANAGER = \(transferManager)*********")
                    print("********* uploadImage:          UPLOADED KEY    = \(key)*********")
                    let contentUrl = self.s3Url.appendingPathComponent(self.bucketName).appendingPathComponent(key)
                    self.contentUrl = contentUrl
                    print("********* uploadImage:          CONTENTURL      = \(contentUrl)*********")
                    self.showAlert(alertTitle: "Image", alertMsg: "Successfully uploaded.")
                    print("************************************ uploadImage:          Copy filename to DB HERE   *********")
                }
                return nil
            }
    }
    func addDBItem() {
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        let myDBItem: DBVIV02 = DBVIV02()
        
        myDBItem._country = input_Country.text!
        myDBItem._userId = input_UserID.text!
        myDBItem._profilePic = filename_PFront.text
        myDBItem._city = input_City.text!
        myDBItem._height = input_Height as NSNumber
        myDBItem._hips = input_Hips as NSNumber
        myDBItem._intention = input_Intention.text!
        print("********* addDBItem:           myDBItem._country = \(myDBItem._country!)   ")
        print("********* addDBItem:           myDBItem._userId = \(myDBItem._userId!)   ")
        print("********* addDBItem:           myDBItem._profilePic = \(myDBItem._profilePic!)   ")
        print("********* addDBItem:           myDBItem._city = \(myDBItem._city!)   ")
        print("********* addDBItem:           myDBItem._height = \(myDBItem._height!)   ")
        print("********* addDBItem:           myDBItem._hips = \(myDBItem._hips!)   ")
        print("********* addDBItem:           myDBItem._intention = \(myDBItem._intention!)   ")
        // Save a new item
        dynamoDbObjectMapper.save(myDBItem, completionHandler: {
            (error: Error?) -> Void in
                if let error = error {
                        print("*************************** Amazon DynamoDB Save Error: \(error) *********")
                        //self.showAlert(alertTitle: "Database", alertMsg: "Error Saving File.")
                        return
                }
                        print("********* addDBItem:          An item was saved. *")
                        // self.showAlert(alertTitle: "Database", alertMsg: "An item was saved.")
                        return
                })
        print("********* addDBItem: END   *********")
    }
    func checkInputs() -> String {
        print("********* checkInputs:     START   *")
        var inputResult = ""
        var localAlertTitle = ""
        var localAlertMsg = ""
        if input_UserID.text == "**" {
            inputResult     = "userId = NIL"
            localAlertTitle = "UserID Field Required"
            localAlertMsg   = "Please enter a UserID before uploading."
        }else{
            // CHECK IF USER ID EXISTS ALREADY IN DB

            print("***************** checkInputs:     search result = \(inputResult)   *")
            if duplicateIDResult == "Duplicate Found"{
                localAlertTitle = "Duplicate UserID"
                localAlertMsg   = "userID already Exists."
                print("********* checkInputs:     FOUND!   *")
            }else{
                print("********* checkInputs:     NOT FOUND   *")
                if duplicateIDResult == "Error in query"{
                    localAlertTitle = "Error in query"
                    localAlertMsg   = "userID already Exists."
                }else{
                    if filename_PFront.text == "**" {
                        inputResult     = "profilePic = NIL"
                        localAlertTitle = "Profile Picture Required"
                        localAlertMsg   = "Please add a profile picture to the Polar Front field before uploading."
                    }else{
                        if input_Country.text == "**" {
                            inputResult     = "country = NIL"
                            localAlertTitle = "Country Field Required"
                            localAlertMsg   = "Please enter a country before uploading."
                        }else{
                            if input_City.text == "**" {
                                inputResult     = "city = NIL"
                                localAlertTitle = "City Field Required"
                                localAlertMsg   = "Please enter a city before uploading."
                            }else{
                                if input_Height == 0 {
                                    inputResult     = "height = NIL"
                                    localAlertTitle = "Height Field Required"
                                    localAlertMsg   = "Please enter their height before uploading."
                                }else{
                                    if input_Hips == 0 {
                                        inputResult     = "hips = NIL"
                                        localAlertTitle = "Hips Field Required"
                                        localAlertMsg   = "Please enter their hips size before uploading."
                                    }else{
                                        if input_Intention.text == "**" {
                                            inputResult     = "intention = NIL"
                                            localAlertTitle = "Intention Field Required"
                                            localAlertMsg   = "Please enter their hairstyle intention before uploading."
                                        }else{
                                            // All required fields completed
                                            inputResult     = "Completed - No issues"
                                            return (inputResult)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        print("********* checkInputs:           END : input Result = \(inputResult)    *")
        showAlert(alertTitle: localAlertTitle, alertMsg: localAlertMsg + "  (input Result = \(inputResult) *" )
        return (inputResult)
    }

    
    func ShowUploadBtn(selectedMediaType : String) -> (Bool, String) {
        hideUploadBtns()
        // check if userId is a duplicate
        switch duplicateIDResult {
            case _ where duplicateIDResult == "Duplicate Found":
                print("********* ShowUploadBtn:       Duplicate Found = \(duplicateIDResult)  *")
                showAlert(alertTitle: "Duplicate UserID", alertMsg: "userID already Exists.  Please enter a different ID")
                //hide button & change textbox to white
                return (true, "#FFFFFF")
            case _ where duplicateIDResult == "Error in query":
                print("********* ShowUploadBtn:       Error in query = \(duplicateIDResult)  *")
                //hide button & change textbox to white
                return (true, "#FFFFFF")
            case _ where duplicateIDResult == "No Duplicate":
                print("********* ShowUploadBtn:       No Duplicate = \(duplicateIDResult)    *")
                //hide button & change textbox to white
            default:
                print("********* ShowUploadBtn:       default result = \(duplicateIDResult)  *")
        }
        
        if img.image != nil {
            print("********* ShowUploadBtn:       Media is displayed   *")
            if globalMediaType != selectedMediaType{
                print("********* ShowUploadBtn - SelectedMediaType NO MATCH    *********")
                showAlert(alertTitle: "Info", alertMsg: "The media displayed is \(globalMediaType).  Please choose a different upload option.")
                //hide button & change textbox to white
                return (true, "#FFFFFF")
            } else {
                print("********* ShowUploadBtn - SelectedMediaType MATCH    *********")
                //show button & change textbox to lightgray
                return (false, "#E4E4E4")
            }
        } else {
            print("********* ShowUploadBtn:       ERROR - NO IMAGE DISPLAYED   *")
            showAlert(alertTitle: "Media Required", alertMsg: "Please select media.")
            //hide button & change textbox to white
            return (true, "#FFFFFF")
        }
    }
    
        
        
        
        
        
        
        
        
        
        
   
    // Setup Buttons
    @IBAction func SelectedBtn(_ sender: Any) {
        selectMyImage()
    }
    @IBAction func uploadBtn_Zcard1(_ sender: Any) {
        filename_Zcard1.text = checkUpload(fileType2: "zCard1")
    }
    @IBAction func uploadBtn_Zcard2(_ sender: Any) {
        filename_Zcard2.text = checkUpload(fileType2: "zCard2")
    }
    @IBAction func uploadBtn_PFront(_ sender: Any) {
        filename_PFront.text = checkUpload(fileType2: "PFront")
        if duplicateIDResult == "Duplicate Found" {
            filename_PFront.textAlignment = .left
        }else{
            filename_PFront.textAlignment = .center
        }
    }
    @IBAction func uploadBtn_PBack(_ sender: Any) {
        filename_PBack.text = checkUpload(fileType2: "PBack")
    }
    @IBAction func uploadBtn_PLSide(_ sender: Any) {
        filename_PLSide.text = checkUpload(fileType2: "PLSide")
    }
    @IBAction func uploadBtn_PRSide(_ sender: Any) {
        filename_PRSide.text = checkUpload(fileType2: "PRSide")
    }
    @IBAction func uploadBtn_PFull(_ sender: Any) {
        filename_PFull.text = checkUpload(fileType2: "PFull")
    }
    @IBAction func uploadBtn_VidCatwalk(_ sender: Any) {
        filename_VidCatwalk.text = checkUpload(fileType2: "VidCatwalk")
    }
    @IBAction func uploadBtn_VidHair(_ sender: Any) {
        filename_VidHair.text = checkUpload(fileType2: "VidHair")
    }
    @IBAction func ShowUploadBtn_Zcard1(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_Zcard1.isHidden = (myValues.0)
        filename_Zcard1.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_Zcard2(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_Zcard2.isHidden = (myValues.0)
        filename_Zcard2.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_PFront(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_PFront.isHidden = (myValues.0)
        filename_PFront.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_PBack(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_PBack.isHidden = (myValues.0)
        filename_PBack.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_PLSide(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_PLSide.isHidden = (myValues.0)
        filename_PLSide.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_PRSide(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_PRSide.isHidden = (myValues.0)
        filename_PRSide.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_PFull(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "an Image")
        uploadBtn_PFull.isHidden = (myValues.0)
        filename_PFull.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_VidCatwalk(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "a Video")
        uploadBtn_VidCatwalk.isHidden = (myValues.0)
        filename_VidCatwalk.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func ShowUploadBtn_VidHair(_ sender: Any) {
        let myValues = ShowUploadBtn(selectedMediaType: "a Video")
        uploadBtn_VidHair.isHidden = (myValues.0)
        filename_VidHair.backgroundColor = hexStringToUIColor(hex: myValues.1)
    }
    @IBAction func inputEnded_UserID(_ sender: Any) {
        print("********* inputEnded_UserID:       START  *")
        duplicateIDResult = searchForUserID(queryString: input_UserID.text!)
        print("********* inputEnded_UserID:       search result = \(duplicateIDResult)   *")
    }
    @IBAction func SubmitPressed(_ sender: Any) {
        print("*************************************************************************************************************")
        print("********* SubmitPressed:    START *")
        let result = checkInputs()
        print("********* SubmitPressed:    \(result)    *")
            if result == "Completed - No issues" {
            addDBItem()
       }else{
            print("********* SubmitPressed:    Issues *")
        }
        print("********* SubmitPressed:    END *")
        print("*************************************************************************************************************")
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func previewImageFromVideo(url:NSURL) -> UIImage? {
        let asset = AVAsset(url:url as URL)
        let imageGenerator = AVAssetImageGenerator(asset:asset)
        imageGenerator.appliesPreferredTrackTransform = true
        var time = asset.duration
        time.value = min(time.value,2)
        do {
            let imageRef = try imageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: imageRef)
        } catch {
            return nil
        }
    }
    
    func searchForUserID(queryString: String) -> String {
        print("********* searchForUserID: 1      START  *")
        let queryExpression = AWSDynamoDBQueryExpression()
        duplicateIDResult = ""
        // Make the query -------------------------------------------------
        queryExpression.indexName = "DBVIV02_UserID"
        queryExpression.keyConditionExpression = "#userId = :userId"
        queryExpression.expressionAttributeNames = [ "#userId" : "userId"]
        queryExpression.expressionAttributeValues = [":userId": input_UserID.text!,]
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDBObjectMapper.query(DBVIV02.self, expression: queryExpression) {
            (response: AWSDynamoDBPaginatedOutput?, error: Error?) -> Void in
            if let error2 = error {
                self.duplicateIDResult = "Error in query"
                print("********* searchForUserID: 4     duplicateIDResult = \(self.duplicateIDResult)  The request failed. Error: \(error2) *")
                return
            }else{
                print("********* searchForUserID: 5      Querying... duplicateIDResult = \(self.duplicateIDResult) ")
                DispatchQueue.main.async(execute: {
                    if (response?.items.count == 0) {
                        self.duplicateIDResult = "No Duplicate"
                        print("********* searchForUserID: 6      duplicateIDResult = \(self.duplicateIDResult) ")
                        return
                    } else {
                        self.duplicateIDResult = "Duplicate Found"
                        print("********* searchForUserID: 7      duplicateIDResult = \(self.duplicateIDResult) Count = \(String(describing: response?.items.count)) ")
                        return
                    }
                })
            }
        }
        print("********* searchForUserID: 8     END  duplicateIDResult = \(duplicateIDResult)   *")
        return (duplicateIDResult)
    }

    
    
    
   // END of VC_AddModel Class
}







// NEW from Imagepicker sample -----------------------
extension VC_AddModel {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let extImageUrl = info[UIImagePickerControllerImageURL] as? URL {
            print("********* EXT imagePickerController: IMAGE SELECTED...  *********")
            showMedia(myMediaType: "Image", passedURL: extImageUrl as NSURL, passedInfo: info)
        } else {
            if let extVideoURL = info["UIImagePickerControllerMediaURL"] as? NSURL {
                print("********* EXT imagePickerController: VIDEO SELECTED...  *********")
                showMedia(myMediaType:"Video", passedURL: extVideoURL, passedInfo: info)
            } else {
                print("********* EXT imagePickerController: VIDEO NOT SELECTED...  *********")
           }
            print("********* EXT imagePickerController: IMAGE NOT SELECTED...  *********")
        }
        print("********* EXT imagePickerController: End function  *********")
        dismiss(animated: true, completion: nil)
    }
    func showMedia(myMediaType: String, passedURL: NSURL, passedInfo: [String: Any]){
        print("********* EXT showMedia: myMediaType      = \(myMediaType) *********")
        if myMediaType == "Image" {
            determineMediaType(newPassedURL: passedURL as NSURL)
            let extImgName = passedURL.lastPathComponent
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            let localPath = documentDirectory?.appending(extImgName!)
            let image = passedInfo[UIImagePickerControllerOriginalImage] as! UIImage
            img.image = image
            let data = UIImagePNGRepresentation(image)! as NSData
            data.write(toFile: localPath!, atomically: true)
            let extImageURL = URL.init(fileURLWithPath: localPath!)
            globalFileURL! = extImageURL
            globalMediaType = "an Image"
            print("********* EXT showMedia: extImgName        = \(String(describing: extImgName))   *********")
            print("********* EXT showMedia: documentDirectory = \(String(describing: documentDirectory)) *********")
            print("********* EXT showMedia: localPath         = \(String(describing: localPath)) *********")
            print("********* EXT showMedia: image             = \(image) *********")
            print("********* EXT showMedia: data              = <<LOADS OF DATA>> *********")
            print("********* EXT showMedia: extImageURL       = \(extImageURL) *********")
        } else {
            if myMediaType == "Video" {
                determineMediaType(newPassedURL: passedURL)
                img.image = previewImageFromVideo(url: passedURL)!
                globalFileURL! = passedURL as URL
                globalMediaType = "a Video"
            } else {
                print("********* EXT showMedia: myMediaType is UNKNOWN       *********")
            }
        }
        print("********* EXT showMedia: globalFileURL     = \(String(describing: globalFileURL)) *********")
    }
    func determineMediaType(newPassedURL: NSURL){
        if newPassedURL.lastPathComponent != nil {
            let fileExtType = newPassedURL.lastPathComponent!.getfileExtType()
            print("*************************** EXT determineMediaType: fileExtType      = \(String(describing: fileExtType)) *********")
            globalFileType = fileExtType
            print("*************************** EXT determineMediaType: globalFileType      = \(String(describing: globalFileType)) *********")
        } else {
            print("*************************** EXT determineMediaType: passedVideoURL.lastPathComponent  = NIL *********")
        }
    }

    // END of VC_AddModel Extension
}

extension String {
    func getfileExtType() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
    // END of String Extension
}














