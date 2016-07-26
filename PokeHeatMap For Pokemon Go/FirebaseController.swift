//
//  FirebaseController.swift
//  PokeHeatMap For Pokemon Go
//
//  Created by youcef bouhafna on 7/23/16.
//  Copyright © 2016 Youcef. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
class FirebaseController {
    
    static let ref = FIRDatabase.database().reference
    
    static func dataAtEndPoint(endpoint:String, completion:(data: AnyObject?) -> Void) {
        let baseForEndpoint = FirebaseController.ref().child(endpoint)
        baseForEndpoint.observeSingleEventOfType(.Value, withBlock: { snapshot in
            if snapshot.value is NSNull {
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
            
        })
        
    }
    static func observerveDataAtEndpoint(endpoint: String, completion:(data: AnyObject?) ->Void) {
        let baseForEndpoint = FirebaseController.ref().child(endpoint)
        baseForEndpoint.observeEventType(.Value, withBlock :{ snapshot in
            if snapshot.value is NSNull {
                completion(data: nil)
            } else {
                completion(data: snapshot.value)
            }
        })
    }
}
protocol FirebaseType {
    var identifier: String? {get set}
    var endpoint: String {get}
    var jsonValue: [String: AnyObject] {get}
    init?(json: [String: AnyObject], identifier: String)
    mutating func save()
    func delete()
}
extension FirebaseType {
    mutating func save() {
        var endpointBase: FIRDatabaseReference
        if let identifier = self.identifier {
            endpointBase = FirebaseController.ref().child(endpoint).child(identifier)
        } else {
            endpointBase = FirebaseController.ref().child(endpoint).childByAutoId()
            self.identifier = endpointBase.key
        }
        endpointBase.updateChildValues(self.jsonValue)
    }
    func delete() {
        if let identifier = self.identifier {
            let endpointBase = FirebaseController.ref().child(endpoint).child(identifier)
            endpointBase.removeValue()
        }
    }
}