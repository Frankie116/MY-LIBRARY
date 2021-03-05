//
//  VC_ViewModelDetail.swift
//  XC21
//
//  Created by Frank Effrim-Botchey on 13/06/2019.
//  Copyright © 2019 myOrganization. All rights reserved.
//

import UIKit
import AWSS3
import AWSCore
import AVKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    var resultData = [String]()
}

class VC_ViewModelDetail: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UITableViewDelegate, UITableViewDataSource
{
    var tableViewData = [cellData]()


    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    var myModelID = ""
    var detailImageName = ""
    let bucketName = "xc902"
    var s3Url: URL!
    var arrayFilename:[String] = []
    var arrayVideoFilename:[String] = []
    let arrayTemplate:[String] =        ["_zCard1.jpeg",
                                         "_zCard2.jpeg",
                                         "_PFull.jpeg",
                                         "_PFront.jpeg",
                                         "_PBack.jpeg",
                                         "_PLSide.jpeg",
                                         "_PRSide.jpeg"]
    var arrayVideoTemplate:[String] = ["_VidCatwalk.MOV",
                                       "_VidHair.MOV"]

    var arrayCharacteristics:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData = [cellData(opened: false, title: "Photos", sectionData: ["Pic1","Pic2","Pic3"], resultData: ["11", "22", "33"]),
                         cellData(opened: false, title: "Videos", sectionData: ["Catwalk","Hair","Other"], resultData: [" Good", " OK", " Not Sure"]),
                         cellData(opened: false, title: "Characteristics", sectionData: ["Height: ",
                                                                                         "Hips: ",
                                                                                         "Waist: ",
                                                                                         "Chest: ",
                                                                                         "UK Size: ",
                                                                                         "Shoe Size: ",
                                                                                         "S,M,L: ",
                                                                                         "Eyes: ",
                                                                                         "Twin: ",
                                                                                         "HairStyle: ",
                                                                                         "Hair Colour: "],
                                                                                resultData: ["176 (height)",
                                                                                             "32 (hips)",
                                                                                             "33 (waist)",
                                                                                             "34 (chest)",
                                                                                             "8 (uk size)",
                                                                                             "6 (shoe size)",
                                                                                             "Small (SML)",
                                                                                             "Blue (eyes)",
                                                                                             "False (twin)",
                                                                                             "Long Curly (hairstyle)",
                                                                                             "Blonde (hair colour)"]),
                         
                         cellData(opened: false, title: "Personal Details", sectionData: ["Firstname: ","Surname: ","Mobile: ", "Email: ", "Country: ", "City: "], resultData: ["11", "22", "33"]),
                         cellData(opened: false, title: "Agency", sectionData: ["Details: "], resultData: ["11", "22", "33"]),
                         cellData(opened: false, title: "Contract", sectionData: ["Details: "], resultData: ["11", "22", "33"])]

        print("********* name            =  \(myModelID) *******")
        print("********* detailImageName =  \(detailImageName) *******")
        detailLabel.text = myModelID
        displayProfileImage(imageFilename: detailImageName)
        setupAuthentication()
        setupArrays()
        detailCollectionView.reloadData()  //--------------------NEED TO SORT COLLECTION RELOAD PROPERLY
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        print("********* numberOfSections =  numberOfSections = \(tableViewData.count)")
        return tableViewData.count
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //---------------Old config works
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        //cell.textLabel?.text = list[indexPath.row]
        //return(cell)
        //-------------------------------
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            guard let myTableCell = tableView.dequeueReusableCell(withIdentifier: "cell2") else {return UITableViewCell()}
            myTableCell.textLabel?.text = tableViewData[indexPath.section].title
            print("********* tableView cellForRowAt =  1. Section: \(tableViewData[indexPath.section].title) *******")
            return myTableCell
        } else {
            //Use different cell identifier if needed
            guard let myTableCell = tableView.dequeueReusableCell(withIdentifier: "cell2") else {return UITableViewCell()}
// working- myTableCell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex] + arrayCharacteristics[dataIndex]
            myTableCell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex] + tableViewData[indexPath.section].resultData[dataIndex]

            print("********* tableView cellForRowAt = 2. Section: \(tableViewData[indexPath.section].title) *******")
            return myTableCell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let dataIndex2 = indexPath.row - 1
        print("********* tableView didSelectRowAt 1 -  Section =  \(tableViewData[indexPath.section].title) *******")
        print("********* tableView didSelectRowAt 1 -  Section =  \(tableViewData[indexPath.row].title) *******")
//        print("********* tableView didSelectRowAt 2 -  indexPath.row =  \(indexPath.row) *******")
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                print("********* tableView didSelectRowAt 3 -  section \(tableViewData[indexPath.section].title) was OPEN *******")
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)  //play around with this
                print("********* tableView didSelectRowAt 4 -  section \(tableViewData[indexPath.section].title) now CLOSED *******")
            } else {
                print("********* tableView didSelectRowAt  -  section \(tableViewData[indexPath.section].title) was CLOSED *******")
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)  //play around with this
                print("********* tableView didSelectRowAt 5 -  section \(tableViewData[indexPath.section].title) now OPEN *******")
            }
        } else {
            let myString = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            
            switch tableViewData[indexPath.section].sectionData[indexPath.row - 1] {
            case _ where myString == "Catwalk":
                print("********* tableView didSelectRowAt 6 -  myString =  \(myString) should be Catwalk! *******")
                playVideo(videoName: myModelID + "_VidCatwalk.MOV")
            case _ where myString == "Hair":
                print("********* tableView didSelectRowAt 7 -  myString =  \(myString) should be Hair! *******")
                 playVideo(videoName: myModelID + "_VidHair.MOV")
            default:
                print("********* tableView didSelectRowAt 8 -  myString =  \(myString) should be Everything Else! *******")
            }
            print("********* tableView didSelectRowAt 9 -  END *******")
        }
    }
    func setupAuthentication(){
        // upload authentication ---------------------------
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.EUWest1, identityPoolId:"REDACTED")
        let configuration = AWSServiceConfiguration(region:.EUWest1, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        s3Url = AWSS3.default().configuration.endpoint.url
    }
    //Define layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width, height: 500)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    //Number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFilename.count
    }
    //Populate view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let localCell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCellID", for: indexPath) as! Cell_ViewModelDetail
        let myNewFilename = arrayFilename[indexPath.row]
        let displayedFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(myNewFilename)
        if let data = NSData(contentsOf: displayedFileURL){
            DispatchQueue.main.async(execute: {
                localCell.myImageView.image = UIImage(data: data as Data)
            })
        }
        print("********* collectionView:   displayed myNewFilename = \(myNewFilename)*********")
        let myLabel = localCell.viewWithTag(1) as! UILabel
        myLabel.text = arrayFilename[indexPath.row]
        return localCell
    }
  
    func setupArrays(){
        print("********* setupArrays =  Creating new array... *******")
        createArray(tmpModelID: myModelID)
        print("********* setupArrays =  Downloading files... *******")
        for newFilename in arrayFilename {
            downloadTheFile(downloadedFilename: newFilename, requestedFilename: newFilename)
        }
        for newVideoFilename in arrayVideoFilename {
            downloadTheFile(downloadedFilename: newVideoFilename, requestedFilename: newVideoFilename)
        }
    }
    func createArray(tmpModelID: String){
        for templateFiletype in arrayTemplate {
            let filename2Add = (tmpModelID + templateFiletype)
            arrayFilename.append(filename2Add)
        }
        for newFilename in arrayFilename {
            print("********* createTmpArray:   newFilename = \(newFilename)*********")
        }
        for templateFiletype2 in arrayVideoTemplate {
            let videofilename2Add = (tmpModelID + templateFiletype2)
            arrayVideoFilename.append(videofilename2Add)
        }
        for newFilename2 in arrayVideoFilename {
            print("********* createTmpArray:   newFilename2 = \(newFilename2)*********")
        }
    }
    func downloadTheFile(downloadedFilename: String, requestedFilename: String) {
        let downloadedFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(downloadedFilename)
        let transferManager = AWSS3TransferManager.default()
        if let downloadRequest = AWSS3TransferManagerDownloadRequest(){
            downloadRequest.bucket = bucketName
            downloadRequest.key = requestedFilename
            downloadRequest.downloadingFileURL = downloadedFileURL
            transferManager.download(downloadRequest).continueWith(block:
                { (task: AWSTask<AnyObject>) -> Any? in
                    if let error = task.error{
                        print("********* downloadFile:   ERROR = \(error))*********")
                    }else{
                        print("********* downloadFile:   downloadedFileURL = \(downloadedFileURL)*********")
                        print("********* downloadFile:   downloadedFilename = \(downloadedFilename)*********")
                        print("********* downloadFile:   requestedFilename = \(requestedFilename)*********")
                    }
                    return nil
            })
        }
    }
    func playVideo(videoName: String){
        print("********* playVideo: STARTED *********")
        globalFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(videoName)
        print("********* ShowVideoBtn: globalFileType      = \(String(describing: globalFileURL)) *********")
        if globalFileURL != nil {
            let tmpVideoURL = globalFileURL
            if tmpVideoURL?.path.contains != nil {
                print ("********* playVideo: contentUrl.path.contains 'MP4' *********")
                print ("************** playVideo: tmpVideoURL = \(String(describing: tmpVideoURL))")
                print ("************** playVideo: tmpVideoURL PATH = \(String(describing: tmpVideoURL?.path))")
                print ("************** playVideo: tmpVideoURL PATH CONTAINS = \(String(describing: tmpVideoURL?.path.contains))")
                let player = AVPlayer(url: tmpVideoURL! as URL)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                present(playerViewController, animated: true, completion: nil)
            } else {
                print ("********* playVideo: ERROR - TmpvideoURL.path = NIL *********")
            }
        } else {
            print ("********* playVideo: ERROR - videoURL = NIL *********")
        }
        print ("********* playVideo: ENDED *********")
    }
    func displayProfileImage(imageFilename: String){
        let displayedFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(imageFilename)
        if let data = NSData(contentsOf: displayedFileURL){
            DispatchQueue.main.async(execute: {
                self.detailImage.image = UIImage(data: data as Data)
            })
        }
        
    }
    
}


    
    
    
    
    

