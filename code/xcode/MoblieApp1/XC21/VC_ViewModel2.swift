//
//  VC_ViewModel2.swift
//  XC21
//
//  Created by Frank Effrim-Botchey on 20/06/2019.
//  Copyright © 2019 myOrganization. All rights reserved.
//

import UIKit
import AWSS3
import AWSCore
import AWSDynamoDB
import AWSAuthCore
import AWSAuthUI

class VC_ViewModel2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let bucketName = "xc902"
    var s3Url: URL!
    


    var profileArray:[String] = []

    var input_MinHeight: NSNumber?
    var input_MaxHeight: NSNumber?
    var input_MinHips: NSNumber?
    var input_MaxHips: NSNumber?
    
    @IBOutlet weak var label_MinHeight: UILabel!
    @IBOutlet weak var label_MaxHeight: UILabel!
    @IBOutlet weak var label_MinHips: UILabel!
    @IBOutlet weak var label_MaxHips: UILabel!
    
    @IBOutlet weak var input_UserId: UITextField!
    @IBOutlet weak var input_City: UITextField!
    @IBOutlet weak var input_Country: UITextField!
    @IBOutlet weak var input_Intention: UITextField!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    

    var myModels: [String: String] = [:]
    var myModelCity: [String: String] = [:]
    
    struct Person {
        var id: String!
        var requestedFile: String!
        var downloadedFile: String!
        var filename: String!
        var name: String!
        var country: String!
        var height: NSNumber?
        var hips: NSNumber?
        var intention: String?
       
        init(myUserId: String, myrequestedFile: String? = nil, mydownloadedFile: String? = nil, myName: String? = nil, myCountry: String? = nil, myHeight: NSNumber? = nil, myHips: NSNumber? = nil, myIntention: String? = nil) {
            self.id = myUserId
            self.requestedFile = myrequestedFile
            self.downloadedFile = mydownloadedFile
            self.name = myName
            self.country = myCountry
            self.height = myHeight
            self.hips = myHips
            self.intention = myIntention
        }
    }
    
    var models = [Person]()
    var queryModels = [Person]()
    var Query = "False"
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.setupAuthentication89()
         input_MinHeight = 170
         input_MaxHeight = 184
         input_MinHips = 30
         input_MaxHips = 38
         Query = "False"
         emptyQueryModels()
         scanAllDB()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setupAuthentication89(){
        // upload authentication ---------------------------
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.EUWest1, identityPoolId:"REDACTED")
        let configuration = AWSServiceConfiguration(region:.EUWest1, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        s3Url = AWSS3.default().configuration.endpoint.url
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if Query != "True"{
            return self.models.count
        }else{
            return self.queryModels.count
        }
    }
    //Populate view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let localCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID2", for: indexPath) as! Cell1_ViewModel2
        var displayedProfileName = ""
        let displayedIDLabel = localCell.viewWithTag(2) as! UILabel
        let nameLabel = localCell.viewWithTag(1) as! UILabel
        if Query != "True"{
            displayedProfileName = self.models[indexPath.row].requestedFile!
            displayedIDLabel.text = self.models[indexPath.item].id!
            nameLabel.text = self.models[indexPath.item].name!
        }else{
            displayedProfileName = self.queryModels[indexPath.row].requestedFile!
            displayedIDLabel.text = self.queryModels[indexPath.item].id!
            nameLabel.text = self.queryModels[indexPath.item].name!
        }
        let displayedFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(displayedProfileName)
        if let data = NSData(contentsOf: displayedFileURL){
            DispatchQueue.main.async(execute: {
                localCell.imageView.image = UIImage(data: data as Data)
                print("********* *************************************collectionView:   displayed image displayedProfileName = \(displayedProfileName)*********")
            })
        }else{
            DispatchQueue.main.async(execute: {
                localCell.imageView.image = UIImage(named: "Viv21.jpeg")
                print("********* *************************************collectionView:   NOT displayed image displayedProfileName = \(displayedProfileName)*********")
            })
        }
        return localCell
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width/2 - 3, height: 270)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    // pass variables to detailedViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VC_ViewModelDetail") as? VC_ViewModelDetail
        vc?.myModelID = self.models[indexPath.row].id!
        vc?.detailImageName = self.models[indexPath.row].requestedFile!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func slider_MinHeight(_ sender: UISlider) {
        label_MinHeight.text = String(Int(sender.value))
        let localInteger = Int(sender.value)
        input_MinHeight = NSNumber(value: localInteger)
        print("********* slider_MinHeight:           input_MinHeight: \(String(describing: input_MinHeight!)) *********")
    }
    @IBAction func slider_MaxHeight(_ sender: UISlider) {
        label_MaxHeight.text = String(Int(sender.value))
        let localInteger = Int(sender.value)
        input_MaxHeight = NSNumber(value: localInteger)
        print("********* slider_MaxHeight:           input_MaxHeight: \(String(describing: input_MaxHeight!)) *********")
    }
    @IBAction func slider_MinHips(_ sender: UISlider) {
        label_MinHips.text = String(Int(sender.value))
        let localInteger = Int(sender.value)
        input_MinHips = NSNumber(value: localInteger)
        print("********* slider_MinHips:           input_MinHips: \(String(describing: input_MinHips!)) *********")
    }
    @IBAction func slider_MaxHips(_ sender: UISlider) {
        label_MaxHips.text = String(Int(sender.value))
        let localInteger = Int(sender.value)
        input_MaxHips = NSNumber(value: localInteger)
        print("********* slider_MaxHips:           input_MaxHips: \(String(describing: input_MaxHips!)) *********")
    }
    @IBAction func blankBtn(_ sender: Any) {
        print("*************************************************************************************************************")
        print("********* blankBtn:      displayStruct()  *")
        displayStruct()
        self.myCollectionView.reloadData()
    }
    func emptyQueryModels() {
        queryModels = [Person]()
        print("********* emptyQueryModels:            Arrays cleared.  *")
    }
    func displayStruct(){
        print("********* displayStruct:      START  *")
        print("********* displayStruct:      query = \(Query)  *")
        if Query == "False" {
            let modelCount = self.models.count
            print("********* displayStruct:            models count = \(self.models.count)  *")
            for n in 0...modelCount-1 {
                print("********* displayStruct:  UserID [\(n)] = \(self.models[n].id!)  requestedFile = \(self.models[n].requestedFile!)  downloadedFile = \(self.models[n].downloadedFile!)  height = \(self.models[n].height!)  hips = \(self.models[n].hips!)  intention = \(self.models[n].intention!)            country = \(self.models[n].country!)            city = \(self.models[n].name!)  *")
            }
        }else{
            let queryModelCount = self.queryModels.count
            print("********* displayStruct:            queryModels count = \(self.queryModels.count)  *")
            for n in 0...queryModelCount-1 {
                print("********* displayStruct:  UserID [\(n)] = \(self.queryModels[n].id!)  requestedFile = \(self.queryModels[n].requestedFile!)  downloadedFile = \(self.queryModels[n].downloadedFile!)  height = \(self.queryModels[n].height!)  hips = \(self.queryModels[n].hips!)  intention = \(self.queryModels[n].intention!)            country = \(self.queryModels[n].country!)            city = \(self.queryModels[n].name!)  *")
            }
        }
    }
    @IBAction func submitQueryBtn(_ sender: Any) {
        print("*************************************************************************************************************")
        print("********* submitQueryBtn:         START *")
        emptyQueryModels()
        let localQueryValue = determineQuery()
        let myValues = createQuery(myQueryValue: localQueryValue)
        if localQueryValue == 0 {
            print("********* submitQueryBtn:         No Query Selected...so running scan all...  *")
            scanAllDB()
        } else {
            print("********* submitQueryBtn:         Query Selected *")
            queryDynamoDB(mainQueryExpression: (myValues.0), mainIndexName: (myValues.1))
        }
        print("********* submitQueryBtn:         END **")
        print("*************************************************************************************************************")
    }
    
    func determineQuery() -> Int {
        var queryValue = 0
        if input_UserId.text! != "" {
            queryValue = queryValue + 16

            print("********* determineQuery:         Adding input_UserId: \(String(describing: input_UserId.text!)) queryValue now: \(queryValue) *")
        } else {
                if input_Intention.text! != "" {
                    queryValue = queryValue + 8
                    print("********* determineQuery:        input_Intention.text: \(String(describing: input_Intention.text!)) queryValue now: \(queryValue) *")
                } else {
                        if input_MinHips == 30 && input_MaxHips == 38 {
                            print("********* determineQuery:         No Hips Query. *")
                        } else {
                            queryValue = queryValue + 4
                            print("********* determineQuery:         input_MinHips: \(String(describing: input_MinHips!)) queryValue now: \(queryValue) *")
                            print("********* determineQuery:         input_MaxHips: \(String(describing: input_MaxHips!)) queryValue now: \(queryValue) *")
                        }
                        if input_MinHeight == 170 && input_MaxHeight == 184 {
                            print("********* determineQuery:         No Height Query. *")
                        } else {
                            queryValue = queryValue + 2
                            print("********* determineQuery:         input_MinHeight: \(String(describing: input_MinHeight!)) queryValue now: \(queryValue) *")
                            print("********* determineQuery:         input_MaxHeight: \(String(describing: input_MaxHeight!)) queryValue now: \(queryValue) *")
                        }

                        if input_Country.text! != "" {
                            queryValue = queryValue + 1
                            print("********* determineQuery:         input_Country: \(String(describing: input_Country.text!)) queryValue now: \(queryValue) *")
                        }
                }
        }
        print("********* determineQuery:         queryValue: \(queryValue)                                                              ")
        return (queryValue)
    }
    func createQuery(myQueryValue: Int) -> (AWSDynamoDBQueryExpression, String){

        let localQueryExpression = AWSDynamoDBQueryExpression()
        var localIndexName = "NOTHING"
        switch myQueryValue {
            case _ where myQueryValue == 0:   // No Filter
                Query = "False"
                print("********* createQuery:            No Query selected. Query = \(Query)  *")
            case _ where myQueryValue == 1:   // Query = Country Only
                localQueryExpression.keyConditionExpression    = "#country = :country"
                print("********* createQuery             localQueryExpression.keyConditionExpression = \(String(describing: localQueryExpression.keyConditionExpression!)) *")
                localQueryExpression.expressionAttributeNames  = [ "#country": "country", ]
                print("********* createQuery             localQueryExpression.expressionAttributeNames = \(String(describing: localQueryExpression.expressionAttributeNames!)) *")
                localQueryExpression.expressionAttributeValues = [":country": input_Country.text!,]
                print("********* createQuery             localQueryExpression.expressionAttributeValues = \(String(describing: localQueryExpression.expressionAttributeValues!)) *")
            case _ where myQueryValue == 2:   // Query = Height Only
                localQueryExpression.indexName = "DBVIV02_HeightOnly"
                localIndexName = localQueryExpression.indexName!
                localQueryExpression.keyConditionExpression = "#height between :minHeight and :maxHeight"
                localQueryExpression.expressionAttributeNames =  ["#height" : "height"]
                localQueryExpression.expressionAttributeValues = [":minHeight": input_MinHeight!, ":maxHeight": input_MaxHeight!, ":height" : input_MinHeight!]
            case _ where myQueryValue == 3:   // Query = Country & Height
                localQueryExpression.indexName = "DBVIV02_Height"
                localIndexName = localQueryExpression.indexName!
                localQueryExpression.keyConditionExpression = "#country = :country AND #height between :minHeight and :maxHeight"
                localQueryExpression.expressionAttributeNames =  ["#country" : "country", "#height" : "height"]
                localQueryExpression.expressionAttributeValues = [":country" : input_Country.text!, ":minHeight" : input_MinHeight!, ":maxHeight" : input_MaxHeight!]
            case _ where myQueryValue == 5:   // Query = Country & Hips
                localQueryExpression.indexName = "DBVIV02_Hips"
                localIndexName = localQueryExpression.indexName!
                localQueryExpression.keyConditionExpression = "#country = :country AND #hips between :minHips and :maxHips"
                localQueryExpression.expressionAttributeNames = [ "#country" : "country", "#hips" : "hips"]
                localQueryExpression.expressionAttributeValues = [":country" : input_Country.text!, ":minHips": input_MinHips!, ":maxHips": input_MaxHips!]
            case _ where myQueryValue == 7:   // Query = Country & Height & Hips
                localQueryExpression.indexName = "DBVIV02_Height"
                localIndexName = localQueryExpression.indexName!
                localQueryExpression.keyConditionExpression = "#country = :country AND #height between :minHeight and :maxHeight AND #hips between :minHips and :maxHips"
                localQueryExpression.expressionAttributeNames = [ "#country" : "country", "#height" : "height", "#hips" : "hips"]
                localQueryExpression.expressionAttributeValues = [":country" : input_Country.text!, ":minHeight": input_MinHeight!, ":maxHeight": input_MaxHeight!, ":minHips": input_MinHips!, ":maxHips": input_MaxHips!,]
            case _ where myQueryValue == 8:   // Query = Intention Only
                localQueryExpression.indexName = "DBVIV02_Intention"
                localIndexName = localQueryExpression.indexName!
                localQueryExpression.keyConditionExpression = "#intention = :intention"
                localQueryExpression.expressionAttributeNames = [ "#intention" : "intention"]
                localQueryExpression.expressionAttributeValues = [":intention": input_Intention.text!,]
            case _ where myQueryValue == 16:   // Query = UserID Only
                localQueryExpression.indexName = "DBVIV02_UserID"
                localIndexName = localQueryExpression.indexName!
                localQueryExpression.keyConditionExpression = "#userId = :userId"
                localQueryExpression.expressionAttributeNames = [ "#userId" : "userId"]
                localQueryExpression.expressionAttributeValues = [":userId": input_UserId.text!,]
            default:                          // Query = This should be an error
                print("************************ createQuery                  Default selection (Error)   *******")
                localIndexName = "ERROR - DEFUALT QUERY"
        }
        return (localQueryExpression, localIndexName)
    }
    func queryDynamoDB(mainQueryExpression: AWSDynamoDBQueryExpression, mainIndexName: String?){
        print("********* queryDynamoDB:          START *")
        let queryExpression = AWSDynamoDBQueryExpression()
        // Make the query -------------------------------------------------
        if mainIndexName != "NOTHING" {
            queryExpression.indexName = mainIndexName
        }else{
            print("********* queryDynamoDB:          Index DB not used ")
        }
        queryExpression.keyConditionExpression = mainQueryExpression.keyConditionExpression
        queryExpression.expressionAttributeNames = mainQueryExpression.expressionAttributeNames
        queryExpression.expressionAttributeValues = mainQueryExpression.expressionAttributeValues
        print("*************************************************************************************************************")
        print("********* queryDynamoDB:          mainIndexName = \(mainIndexName!)  *******")
        print("********* queryDynamoDB:          queryExpression.keyConditionExpression = \(String(describing: queryExpression.keyConditionExpression!)) *")
        print("********* queryDynamoDB:          queryExpression.expressionAttributeNames = \(String(describing: queryExpression.expressionAttributeNames!)) *")
        print("********* queryDynamoDB:          queryExpression.expressionAttributeValues = \(String(describing: queryExpression.expressionAttributeValues!)) *")
        print("*************************************************************************************************************")
        let dynamoDbObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDbObjectMapper.query(DBVIV02.self, expression: queryExpression) {
            (response: AWSDynamoDBPaginatedOutput?, error: Error?) -> Void in
            self.populateArray(NEWresponse: response, NEWerror: error)
        }
        print("********* queryDB_ByCountry:      END  *")
    }
    
    func populateArray(NEWresponse: AWSDynamoDBPaginatedOutput?, NEWerror: Error?){
        print("********* populateArray: 1         START *")
        if let error = NEWerror {
            print("********* populateArray: 2         The request failed. Error: \(error) *")
        } else {
            DispatchQueue.main.async(execute: {
                    print("********* populateArray: 3        Scanning - Querying... ")
                    if (NEWresponse?.items.count == 0) {
                        print("********* populateArray: 4        Count was 0 so nothing to do... ")
                    } else {
                        self.Query = "True"
                        print("********* populateArray: 5        Count = \(String(describing: NEWresponse?.items.count)) *")
                        for item in (NEWresponse?.items)! {
                            print("********* populateArray: 6        item START: \(item) *********")
                            if (item.value(forKey: "_userId") != nil ){
                                let db_UserID = item.value(forKey: "_userId") as! String
                                let db_Filename = (item.value(forKey: "_userId") as! String) + "_PFront.jpeg"
                                let db_Name = item.value(forKey: "_city") as! String
                                let db_Country = item.value(forKey: "_country") as! String
                                let db_Height = item.value(forKey: "_height") as! NSNumber
                                let db_Hips = item.value(forKey: "_hips") as! NSNumber
                                let db_Intention = item.value(forKey: "_intention") as! String
                          
                                self.queryModels.append(Person(myUserId: db_UserID, myrequestedFile: db_Filename, mydownloadedFile: "BLANK", myName: db_Name, myCountry: db_Country, myHeight: db_Height, myHips: db_Hips, myIntention: db_Intention))
                                print("********* populateScanArray: 7    Appending: db_UserID: \(db_UserID)    db_Filename: \(db_Filename)   mydownloadedFile: 'BLANK'   db_Name: \(db_Name)    db_Country: \(db_Country)    db_Height: \(db_Height)    db_Hips: \(db_Hips)    db_Intention: \(db_Intention)    ")
                                

                            } else {
                                print("********* populateArray: 8        _userId = nil *")
                            }
                        }
                        print("********* populateArray: 9        will now download & reload... *")
                        self.downloadProfiles()
                        self.myCollectionView.reloadData()
                    }
            })
        }
        print("********* populateArray: 10      end  *")
    }

    
    
    func downloadProfiles(){
        print("********* downloadProfiles        Downloading files...  *")
        let max = self.models.count - 1// check !!!
        for n in 0...max {
            if (self.downloadTheFile89(downloadedFilename: self.models[n].requestedFile!, requestedFilename: self.models[n].requestedFile!) == true) {
                // print("********* downloadProfiles        Download ok  *")
                self.models[n].downloadedFile! = self.models[n].requestedFile!
            } else {
                print("********* downloadProfiles        Download failed *")
            }
        }
        self.myCollectionView.reloadData()
        displayStruct()
    }
    func downloadTheFile89(downloadedFilename: String, requestedFilename: String) -> Bool{
        let downloadedFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(downloadedFilename)
        let transferManager = AWSS3TransferManager.default()
        if let downloadRequest = AWSS3TransferManagerDownloadRequest(){
            downloadRequest.bucket = bucketName
            downloadRequest.key = requestedFilename
            downloadRequest.downloadingFileURL = downloadedFileURL
            transferManager.download(downloadRequest).continueWith(block:
                { (task: AWSTask<AnyObject>) -> Any? in
                    if let error = task.error{
                        print("********* downloadTheFile89: 1   Download Error = \(error) *********")
                        return (false)
                    }else{
                        print("********* downloadTheFile89: 2   Download OK - downloadedFileURL = \(downloadedFileURL) , requestedFilename = \(requestedFilename) *********")
                        return (true)
                    }
                })
                // print("********* downloadTheFile89: 3   requestedFilename = \(requestedFilename) *********")
                return (true)
        }else{
            print("********* downloadTheFile89: 4   Download Error - downloadedFileURL = \(downloadedFileURL) , requestedFilename = \(requestedFilename) *********")
            return (false)
        }
    }
    
    
    //  --------------------------USED AT THE BEGINING WHEN VIEWDIDLOAD
    func scanAllDB() {
        print("********* scanAllDB:              START *")
        emptyQueryModels()
        let scanExpression = AWSDynamoDBScanExpression()
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        dynamoDBObjectMapper.scan(DBVIV02.self, expression: scanExpression).continueWith(block: {
            (response:AWSTask<AWSDynamoDBPaginatedOutput>!) -> Any? in
            let error = response.error as NSError?
            self.populateScanArray(NEWresponse: response, NEWerror: error)
            return nil
        })
        print("********* scanAllDB:              END  *")
    }
    func populateScanArray(NEWresponse:AWSTask<AWSDynamoDBPaginatedOutput>!, NEWerror: Error?){
        if let error = NEWresponse.error as NSError? {
            print("********* populateScanArray:       The request failed. Error: \(error) *")
        } else {
            DispatchQueue.main.async(execute: {
                if let paginatedOutput = NEWresponse.result {
                    for item in paginatedOutput.items as! [DBVIV02] {
                        print("********* populateScanArray:      item START: \(item) *********")
                        let myNewItem = item.value(forKey: "country")
                        print("********* populateScanArray:      item END  : \(String(describing: myNewItem!)) *")
                        if (item.value(forKey: "_userId") != nil ){
                            let db_UserID = item.value(forKey: "_userId") as! String
                            let db_Filename = (item.value(forKey: "_userId") as! String) + "_PFront.jpeg"
                            let db_Name = item.value(forKey: "_city") as! String
                            let db_Country = item.value(forKey: "_country") as! String
                            let db_Height = item.value(forKey: "_height") as! NSNumber
                            let db_Hips = item.value(forKey: "_hips") as! NSNumber
                            let db_Intention = item.value(forKey: "_intention") as! String
                         
                            self.models.append(Person(myUserId: db_UserID, myrequestedFile: db_Filename, mydownloadedFile: "BLANK", myName: db_Name, myCountry: db_Country, myHeight: db_Height, myHips: db_Hips, myIntention: db_Intention))
                            print("********* populateScanArray:      Appending: db_UserID: \(db_UserID)    db_Filename: \(db_Filename)   mydownloadedFile: 'BLANK'   db_Name: \(db_Name)    db_Country: \(db_Country)    db_Height: \(db_Height)    db_Hips: \(db_Hips)    db_Intention: \(db_Intention)    ")
                        } else {
                            print("********* populateScanArray:      _userId = nil *")
                        }
                    }
                    self.downloadProfiles()
                    self.myCollectionView.reloadData()
                } else {
                    print("********* populateScanArray:      Count was 0 so nothing to do... *")
                }
            })
        }
    }
}

extension String {
    var numberValue: NSNumber? {
        if let value = Int(self) {
            return NSNumber(value: value)
        }
        return nil
    }
}








