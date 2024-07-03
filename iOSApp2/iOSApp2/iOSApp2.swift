//
//  iOSApp2.swift
//  iOSApp2
//
//  Created by Owner on 2024-06-29.
//

import UIKit

class iOSApp2: NSObject, Codable {
    var name = ""
    var items =  [MenuItem]()
    init(name: String) {
    self.name = name
      super.init()
    }
}
