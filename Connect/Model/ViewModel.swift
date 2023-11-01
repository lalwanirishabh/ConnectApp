//
//  ViewModel.swift
//  Connect
//
//  Created by Rishabh Lalwani on 01/11/23.
//

import Foundation
import UIKit

class ViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var image: UIImage? = UIImage()
}
