//
//  File.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import Foundation

struct NetworkConstants {

    enum endPoint {
        case query(query: String, nextPage: String)
        case next(nextPage: String)
        
        var url: String {
            switch self {
            case .query(let query, let nextPage):
                return "&query=".appending(query).appending("&page=".appending(nextPage))
            case .next(let page):
                return "&page=".appending(page)
      
            }
        }
    }
    
}

