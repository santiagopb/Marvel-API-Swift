//
//  Log.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import SwiftyBeaver

class Log {
    
    static let write: SwiftyBeaver.Type = {
        let console = ConsoleDestination()
        console.format = "$DHH:mm:ss$d $N.$F():$l $L: $M"
        console.levelString.verbose = "đŖ VERBOSE"
        console.levelString.debug   = "đ DEBUG"
        console.levelString.info    = "âšī¸ INFO"
        console.levelString.warning = "â ī¸ WARNING"
        console.levelString.error   = "đ ERROR"
        let a = SwiftyBeaver.self
        a.addDestination(console)
        
        return a
    }()
    
    static func info(_ message: String) {
        write.info(message)
    }
    
    static func error(_ message: String) {
        write.error(message)
    }
    
    static func warning(_ message: String) {
        write.warning(message)
    }
    
    static func debug(_ message: String) {
        write.debug(message)
    }
    
    static func error(_ message: String, error: Error?) {
        write.error(message)
    }
    
    private init() { }
    
    
}

