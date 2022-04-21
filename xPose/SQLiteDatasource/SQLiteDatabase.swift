//
//  SQLiteDatabase.swift
//  xPose
//
//  Created by Xavier Welscher on 21.04.22.
//

import Foundation
import SQLite3

class SQLiteDatabase {
    
    static func getDatabasePointer(databaseName: String) -> OpaquePointer? {
        var db: OpaquePointer?
        
        // create file
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(databaseName).path
        
        if FileManager.default.fileExists(atPath: documentDatabasePath) {
            print("Databse already exists")
        } else {
            
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent(databaseName).path else {
                print("Unwrapping Error: Bundle Database Path doesn't exist")
                return nil
            }
            
            do {
                try FileManager.default.copyItem(atPath: bundleDatabasePath, toPath: documentDatabasePath)
                print("Database created (copied)")
            } catch {
                print("Error: \(error.localizedDescription)")
                return nil
            }
        }
        
        if sqlite3_open(documentDatabasePath, &db) == SQLITE_OK {
            print("Successfully opened database")
            print("Database path: \(documentDatabasePath)")
        } else {
            print("Could not open database")
        }
        
        return db
        
    }
}
