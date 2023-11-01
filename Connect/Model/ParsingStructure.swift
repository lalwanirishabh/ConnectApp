//
//  ParsingStructure.swift
//  Connect
//
//  Created by Rishabh Lalwani on 01/11/23.
//

import Foundation

struct getPost: Codable{
//    let posts : [post]
    let error: String
}

struct post: Codable{
    let name: String
    let title: String
    let content: String
}

struct AddPost: Codable{
    let message: String
    let error: String
}

struct getAlumni: Codable{
    let alumni: [alumni]
}

struct alumni: Codable{
    let alumni_id: Int
    let name: String
    let grad_year: String
    let contact_info: String
    let company: String
}

struct getAlumniByCompany: Codable{
    let alumni: [alumni]
}

struct getAlumniByGradYear: Codable{
    let alumni: [alumni]
}

struct addAlumni: Codable{
    let message: String
    let error: String
}

struct fund: Codable{
    let donation_id: Int
    let amount: String
    let date: String
    let description: String
    let alumni_name: String
}

struct getAlumniFunds: Codable{
    let funds: [fund]
}

struct getAlumniFundsByName: Codable{
    let alumni: [fund]
}

struct addDonationByAlumni: Codable{
    let message: String
    let error: String
}



