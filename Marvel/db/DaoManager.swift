//
//  DaoManager.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift
import struct RealmSwift.SortDescriptor

enum DBError: Error {
    case instanceNotAvailable, cantSaveObject, cantDeleteAll
}

class DaoManager {
    
    private(set) var database: Realm?
    
    init() {
        openRealm()
    }
    
    func openRealm() {
        do {
            var config = Realm.Configuration()
            config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("localDatabase")
            config.readOnly = false
            config.schemaVersion = 1
            
            database = try Realm(configuration: config)
        } catch {
            Log.error("Error opening Realm: \(error)")
        }
    }
    
    func addObject(with data: Object) {
        do {
            try save(object: data)
        } catch(let e) {
            Log.error(e.localizedDescription)
        }
    }
    
    func addObjects(with data: [Object]) {
        do {
            try save(objects: data)
        } catch(let e) {
            Log.error(e.localizedDescription)
        }
    }
    
    func get<T: Object>(type: T.Type) throws -> Results<T>? {
        
        guard let database = database else {
            Log.error("instance not available")
            throw DBError.instanceNotAvailable
        }
        
        return database.objects(type)
        
    }
    
    func delete(object: Object) {
        
        guard let database = database else {
            Log.error("instance not available")
            return
        }
        
        do {
            try database.write {
                Log.debug(object.description)
                database.delete(object)
                try database.commitWrite()
            }
        } catch(let e) {
            Log.error(e.localizedDescription)
        }
    }
    
    func save(object: Object) throws {
        guard let database = database else {
            Log.error("instance not available")
            throw DBError.instanceNotAvailable
        }
        
        do {
            database.refresh()
            try database.write {
                Log.debug(object.description)
                database.add(object, update: .modified)
            }
        } catch(let e) {
            Log.error(e.localizedDescription)
            throw DBError.cantSaveObject
        }
    }
    
    func save<S: Sequence>(objects: S) throws where S.Iterator.Element: Object {
        guard let database = database else {
            Log.error("instance not available")
            return
        }
        
        do {
            try database.write {
                Log.debug(Array(objects).description)
                database.add(objects, update: .modified)
            }
        } catch(let e) {
            Log.error(e.localizedDescription)
            throw DBError.cantSaveObject
        }
    }

    func delete<T: Object>(type: T.Type, predicate: NSPredicate?) throws {
        
        guard let database = database else {
            Log.error("instance not available")
            throw DBError.instanceNotAvailable
        }
        
        guard let results = try get(type: type, predicate: predicate, sort: nil) else {
            Log.error("no results found")
            return
        }
        
        do {
            try database.write {
                database.delete(results)
                try database.commitWrite()
            }
        } catch(let e) {
            Log.error(e.localizedDescription)
        }
        
    }
    
    func get<T: Object, K>(type: T.Type, key: K) throws -> T? {
        
        guard let database = database else {
            Log.error("instance not available")
            throw DBError.instanceNotAvailable
        }
        
        return database.object(ofType: type, forPrimaryKey: key)
    }
    
    func get<T: Object>(type: T.Type, predicate: NSPredicate?, sort: [SortDescriptor]?) throws -> Results<T>? {
        
        guard let database = database else {
            Log.error("instance not available")
            throw DBError.instanceNotAvailable
        }
        
        var _partialResult = database.objects(type)
        
        if let predicate = predicate {
            _partialResult = _partialResult.filter(predicate)
        }
        
        if let result = sort {
            return _partialResult.sorted(by: result)
        } else {
            return _partialResult
        }
    }
    
}
