//
//  Album.swift
//  Albums
//
//  Created by Mitchell Budge on 6/10/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation

struct Album: Decodable {
    var artist: String
    var coverArt: [URL]
    var genres: [String]
    var id: String
    var name: String
    var songs: [Song]
    
    enum AlbumKeys: String, CodingKey {
        case artist
        case coverArt
        case genres
        case id
        case name
        case songs
        
        enum CoverArtKeys: String, CodingKey {
            case url
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AlbumKeys.self)
        artist = try container.decode(String.self, forKey: .artist)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        genres = try container.decode([String].self, forKey: .genres)
        songs = try container.decode([Song].self, forKey: .songs)
        var coverArtContainer = try container.nestedUnkeyedContainer(forKey: .coverArt)
        var urlStrings: [URL] = []
        while coverArtContainer.isAtEnd == false {
            let urlContainer = try coverArtContainer.nestedContainer(keyedBy: AlbumKeys.CoverArtKeys.self)
            let urlString = try urlContainer.decode(URL.self, forKey: .url)
            urlStrings.append(urlString)
        }
        coverArt = urlStrings
    }
}

struct Song: Decodable {
    var duration: String
    var id: String
    var name: String
    
    enum SongKeys: String, CodingKey {
        case duration
        case id
        case name
        
        enum DurationKeys: String, CodingKey {
            case duration
        }
        
        enum NameKeys: String, CodingKey {
            case title
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SongKeys.self)
        id = try container.decode(String.self, forKey: .id)
        let durationContainer = try container.nestedContainer(keyedBy: SongKeys.DurationKeys.self, forKey: .duration)
        duration = try durationContainer.decode(String.self, forKey: .duration)
        let nameContainer = try container.nestedContainer(keyedBy: SongKeys.NameKeys.self, forKey: .name)
        name = try nameContainer.decode(String.self, forKey: .title)
    }
}

//"artist" : "Weezer",
//"coverArt" : [ {
//"url" : "https://lastfm-img2.akamaized.net/i/u/174s/1918fe81bb68441d96b2247682bfda21.png"
//} ],
//"genres" : [ "Alternative" ],
//"id" : "5E58FA0F-7DBD-4F1D-956F-89756CF1EB22",
//"name" : "Weezer (The Blue Album)",
//"songs" : [ {
//"duration" : {
//"duration" : "3:25"
//},
//"id" : "82BDE132-E492-4FED-9A77-B49CADBC2BFD",
//"name" : {
//"title" : "My Name Is Jonas"
//}
//}
