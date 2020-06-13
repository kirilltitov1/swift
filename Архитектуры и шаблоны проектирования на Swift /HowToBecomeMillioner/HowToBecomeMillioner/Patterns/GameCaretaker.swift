//
//  GameCaretaker.swift
//  HowToBecomeMillioner
//
//  Created by Kirill Titov on 14/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import Foundation


final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(records: [Record]) {
        do {
            let data = try self.encoder.encode(records)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func upload() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: key)
            else { return [] }
        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
}
