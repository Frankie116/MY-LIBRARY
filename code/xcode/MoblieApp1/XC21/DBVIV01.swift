//
//  DBVIV01.swift
//  MySampleApp
//
//
// Copyright 2019 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.21
//

import Foundation
import UIKit
import AWSDynamoDB

class DBVIV01: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    var _country: String?
    var _userId: String?
    var _city: String?
    var _height: String?
    var _hips: String?
    var _intention: String?
    
    class func dynamoDBTableName() -> String {

        return "xc-mobilehub-REDACTED-DBVIV01"
    }
    
    class func hashKeyAttribute() -> String {

        return "_country"
    }
    
    class func rangeKeyAttribute() -> String {

        return "_userId"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
               "_country" : "country",
               "_userId" : "userId",
               "_city" : "city",
               "_height" : "height",
               "_hips" : "hips",
               "_intention" : "intention",
        ]
    }
}
