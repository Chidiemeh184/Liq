//
//  Pager.swift
//  Liq
//
//  Created by Chidi Emeh on 2/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation

struct Pager : Codable {
    
    var recordsPerPage : Int?
    var totalRecordCount : Int?
    var currentPageRecordCount : Int?
    var isFirstPage : Bool
    var isFinalPage : Bool
    var currentPage : Int?
    var currentPagePath : String
    var nextPage : Int?
    var nextPagePath : URL?
    var previousPage : Int?
    var previousPagePath : URL?
    var totalPage : Int?
    var totalPagePath : URL?
    
    private enum CodingKeys : String, CodingKey {
        
        case recordsPerPage = "records_per_page"
        case totalRecordCount = "total_record_count"
        case currentPageRecordCount = "current_page_record_count"
        case isFirstPage = "is_first_page"
        case isFinalPage = "is_final_page"
        case currentPage = "current_page"
        case currentPagePath = "current_page_path"
        case nextPage = "next_page"
        case nextPagePath = "next_page_path"
        case previousPage = "previous_page"
        case previousPagePath = "previous_page_path"
        case totalPage = "total_page"
        case totalPagePath = "total_page_path"
    }
    
    
    
}
