//
//  Record.swift
//  HowToBecomeMillioner
//
//  Created by Kirill Titov on 14/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


class Record: Codable {
    var date: Date
    var value: Int
    
    init(data: Data, value: Int) {
        self.date = Date()
        self.value = value
    }
}


class Records {
    private var records: [Record] = []
    
    public static var shared = Records()
    
    private init() {}
    
    func addRecord(_ record: Record) {
        self.records.append(record)
    }
    
    func clearRecords() {
        self.records = []
    }
    
    func getRecords() -> [Record] {
        return self.records
    }
}
