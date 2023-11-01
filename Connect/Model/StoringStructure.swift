//
//  StoringStructure.swift
//  Connect
//
//  Created by Rishabh Lalwani on 01/11/23.
//

import Foundation

struct PostStructure: Identifiable {
    var id: String
    var name: String
    var title: String
    var content: String
}

struct AlumniStructure: Identifiable{
    var id: String
    var name: String
    var grad_year: String
    var contact_info: String
    var company: String
}

struct FundStructure: Identifiable{
    var id: String
    var amount: String
    var date: String
    var description: String
    var name: String
}


