

import Foundation

class Restuarants : Codable {
    let id : Int?
    let name : String?
    let description : String?
    let hours : String?
    let image : String?
    let rating : Double?
    let distance : Double?
    let hasOffer : Bool?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case name = "name"
        case description = "description"
        case hours = "hours"
        case image = "image"
        case rating = "rating"
        case distance = "distance"
        case hasOffer = "hasOffer"
    }

}
