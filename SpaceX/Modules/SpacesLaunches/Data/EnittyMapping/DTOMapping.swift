//
//  DTOMapping.swift
//  SpaceX
//
//  Created by Bahar on 5/9/1403 AP.
//

import Foundation


extension LaunchesResponse {
    
    func toDomain() -> Page<LaunchMission> {
        Page(items: docs.map {
            $0.toDomain()
        },
             totalDocs: totalDocs,
             offset: offset,
             limit: limit,
             totalPages: totalPages,
             page: page,
             pagingCounter: pagingCounter,
             hasPrevPage: hasPrevPage,
             hasNextPage: hasNextPage,
             prevPage: prevPage,
             nextPage: nextPage)
    }
}

extension CoreDTO {
    func toDomain() -> Core {
        Core(core: core,
             flight: flight, gridfins: gridfins , legs: legs, reused: reused, landingAttempt: landingAttempt, landingSuccess: landingSuccess)
    }
}


extension CrewDTO {
    func toDomain() -> Crew {
        Crew(crew: crew, role: role)
    }
}

extension FairingsDTO {
    func toDomain() -> Fairings {
        Fairings(reused: reused, recovery_attempt: recovery_attempt, recovered: recovered, ships: ships)
    }
}


extension FlickrDTO {
    func toDomain() -> Flickr {
        
        Flickr(small: small, original: original)
        
    }
}

extension LaunchDTO {
    func toDomain() -> LaunchMission {
        LaunchMission(fairings: fairings?.toDomain(),
                      links: links.toDomain(),
                      static_fire_date_utc: static_fire_date_utc,
                      static_fire_date_unix: static_fire_date_unix,
                      net: net,
                      window: window,
                      rocket: rocket,
                      success: success,
                      failures: failures,
                      details: details,
                      crew: crew?.map{ $0.toDomain() },
                      ships: ships,
                      capsules: capsules,
                      payloads: payloads,
                      launchpad: launchpad,
                      flightNumber: flightNumber,
                      name: name,
                      date_UTC: date_UTC,
                      date_Unix: date_Unix,
                      date_Local: date_Local,
                      date_Precision: date_Precision,
                      upcoming: upcoming,
                      cores: cores.map { $0.toDomain()},
                      autoUpdate: autoUpdate,
                      tbd: tbd,
                      launchLibraryID: launchLibraryID,
                      id: id)
    }
}

extension LinksDTO {
    func toDomain() -> Links {
        Links(patch: patch.toDomain(),
              reddit: reddit.toDomain(),
              flickr: flickr.toDomain(),
              presskit: presskit,
              webcast: webcast,
              youtube_id: youtube_id,
              article: article,
              wikipedia: wikipedia)
        
    }
}
extension PatchDTO {
    func toDomain() -> Patch {
        Patch(small: small, large: large)
        
    }
}
extension RedditDTO {
    func toDomain() -> Reddit {
        Reddit(campaign: campaign,
               launch: launch,
               media: media,
               recovery: recovery)
        
    }
}
