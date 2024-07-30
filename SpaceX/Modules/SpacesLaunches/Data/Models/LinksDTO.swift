//
//  LinksDTO.swift
//  SpaceX
//
//  Created by Bahar on 5/7/1403 AP.
//

import Foundation

struct LinksDTO: Codable {
    let patch: PatchDTO
    let reddit: RedditDTO
    let flickr: FlickrDTO
    let presskit: String?
    let webcast: String
    let youtube_id: String
    let article, wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtube_id
        case article, wikipedia
    }
}
