//
//  RadioStation.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/4/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit

//*****************************************************************
// Radio Station
//*****************************************************************

/*struct SongsRequest: Codable {
    
    let requestID, requestURL, songID, songText: String
    let songArtist, songTitle, songAlbum, songLyrics: String
    let songArt: String
    
    init(requestID: String, requestURL: String, songID: String, songText: String, songArtist: String = "", songTitle: String, songAlbum: String, songLyrics: String, songArt: String) {
        self.requestID = requestID
        self.requestURL = requestURL
        self.songID = songID
        self.songText = songText
        self.songArtist = songArtist
        self.songTitle = songTitle
        self.songAlbum = songAlbum
        self.songLyrics = songLyrics
        self.songArt = songArt
    }
}*/

struct SongRequest: Codable {
    let current, rowCount, total: Int
    let rows: [Row]
    
    init(current: Int, rowCount: Int, total: Int, rows: [Row]) {
        self.current = current
        self.rowCount = rowCount
        self.total = total
        self.rows = rows
    }
}

struct Row: Codable {
    let requestID, requestURL, songID, songText: String
    let songArtist, songTitle, songAlbum, songLyrics: String
    let songArt: String
    
    enum CodingKeys: String, CodingKey {
        case requestID = "request_id"
        case requestURL = "request_url"
        case songID = "song_id"
        case songText = "song_text"
        case songArtist = "song_artist"
        case songTitle = "song_title"
        case songAlbum = "song_album"
        case songLyrics = "song_lyrics"
        case songArt = "song_art"
    }
    
    init(requestID: String, requestURL: String, songID: String, songText: String, songArtist: String, songTitle: String, songAlbum: String, songLyrics: String, songArt: String) {
        self.requestID = requestID
        self.requestURL = requestURL
        self.songID = songID
        self.songText = songText
        self.songArtist = songArtist
        self.songTitle = songTitle
        self.songAlbum = songAlbum
        self.songLyrics = songLyrics
        self.songArt = songArt
    }
}

extension Row: Equatable {
    
    static func ==(lhs: Row, rhs: Row) -> Bool {
     return (lhs.songArtist == rhs.songArtist) && (lhs.requestURL == rhs.requestURL) && (lhs.songArt == rhs.songArt) && (lhs.songTitle == rhs.songTitle) && (lhs.songID == rhs.songID)
     }
}


