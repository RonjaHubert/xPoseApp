//
//  SQLiteCommands.swift
//  xPose
//
//  Created by Xavier Welscher on 21.04.22.
//

import Foundation
import SQLite3

class SQLiteCommands {
    
    var db: OpaquePointer?
    var path: String = "accounts.sqlite"
    
    init() {
        self.db = createDB()
        self.createTable()
    }

    func createDB() -> OpaquePointer? {
        let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
        
        var db: OpaquePointer? = nil
        
        if sqlite3_open(filePath.path, &db) != SQLITE_OK {
            print("Error: Creating Database failed!")
            return nil
        } else {
            print("Database has been created with path \(path)")
            return db
        }
    }
    
    func createTable() {
        let query = "CREATE TABLE IF NOT EXISTS accounts(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT, name TEXT, lastname TEXT, gender CHAR, birthday INTEGER);"
        var statement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table created")
            } else {
                print("Table-Creation failed")
            }
        } else {
            print("Preperation failed")
        }
    }
}
