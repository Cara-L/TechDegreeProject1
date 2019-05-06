import UIKit

// Players' information presented as dictionaries:

let joeSmith: [String: String] = ["name": "Joe Smith", "height" : "42.0", "experience": "true", "guardians": "Jim and Jan Smith"]

let jillTanner: [String: String] = ["name": "Jill Tanner", "height" : "36.0", "experience": "true", "guardians": "Clara Tanner"]

let billBon: [String: String] = ["name": "Bill Bon", "height" : "43.0", "experience": "true", "guardians": "Sara and Jenny Bon"]

let evaGordon: [String: String] = ["name": "Eva Gordon", "height" : "45.0", "experience": "false", "guardians": "Wendy and Mike Gordon"]

let mattGill: [String: String] = ["name": "Matt Gill", "height" : "40.0", "experience": "false", "guardians": "Charles and Sylvia Gill"]

let kimmyStein: [String: String] = ["name": "Kimmy Stein", "height" : "41.0", "experience": "false", "guardians": "Bill and Hillary Stein"]

let sammyAdams: [String: String] = ["name": "Sammy Adams", "height" : "45.0", "experience": "false", "guardians": "Jeff Adams"]

let karlSaygan: [String: String] = ["name": "Karl Saygan", "height" : "42.0", "experience": "true", "guardians": "Heather Bledsoe"]

let suzaneGreenberg: [String: String] = ["name": "Suzane Greenberg", "height" : "44.0", "experience": "true", "guardians": "Henrietta Dumas"]

let salDali: [String: String] = ["name": "Sal Dali", "height" : "41.0", "experience": "false", "guardians": "Gala Dali"]

let joeKavalier: [String: String] = ["name": "Joe Kavalier", "height" : "39.0", "experience": "false", "guardians": "Sam and Elaine Kavalier"]

let benFinkelstein: [String: String] = ["name": "Ben Finkelstein", "height" : "44.0", "experience": "false", "guardians": "Aaron and Jill Finkelstein"]

let diegoSoto: [String: String] = ["name": "Diego Soto", "height" : "41.0", "experience": "true", "guardians": "Robin and Sarika Soto"]

let chloeAlaska: [String: String] = ["name": "Chloe Alaska", "height" : "47.0", "experience": "false", "guardians": "David and Jamie Alaska"]

let arnoldWillis: [String: String] = ["name": "Arnold Willis", "height" : "43.0", "experience": "false", "guardians": "Claire Willis"]

let phillipHelm: [String: String] = ["name": "Phillip Helm", "height" : "44.0", "experience": "true", "guardians": "Thomas Helm and Eva Jones"]

let lesClay: [String: String] = ["name": "Les Clay", "height" : "42.0", "experience": "true", "guardians": "Wynonna Brown"]

let herschelKrustofski: [String: String] = ["name": "Herschel Krustofski", "height" : "45.0", "experience": "true", "guardians": "Hyman and Rachel Krustofski"]

//Declaring the players, as represented in a dictionary, and separating them into teams using a For In Loop:

var players: [[String: String]] = [joeSmith, jillTanner, billBon, evaGordon, mattGill, kimmyStein, sammyAdams, karlSaygan, suzaneGreenberg, salDali, joeKavalier, benFinkelstein, diegoSoto, chloeAlaska, arnoldWillis, phillipHelm, lesClay, herschelKrustofski]

func groupByExperience(players: [[String: String]]) -> (experienced: [[String: String]], inexperienced: [[String: String]]) {
    
    var experienced: [[String: String]] = []
    var inexperienced: [[String: String]] = []
    
    for player in players {
        if player["experience"] == "true" {
            experienced.append(player)
        }else {
            inexperienced.append(player)
        }
    }
    
    return(experienced: experienced, inexperienced: inexperienced)
}

var groups = groupByExperience(players: players)

print(groups.experienced)
print(groups.inexperienced)
print(groups.experienced.count)
print(groups.inexperienced.count)

// Sorting the players by height using the .sorted method:

let experiencedByHeight: [[String: String]] = groups.experienced.sorted() {
    return $0["height"]! < $1["height"]!
}
let inexperiencedByHeight: [[String: String]]  = groups.inexperienced.sorted() {
    return $0["height"]! > $1["height"]!
}

// Sorting the players into three teams using dictionaries and a For In Loop:

var teamDragons: [[String : String]] = []

var teamSharks: [[String : String]] = []

var teamRaptors: [[String : String]] = []

var teams = [teamDragons, teamSharks, teamRaptors]

func sortPlayersIntoTeams(players: [[String: String]]) {
    
    for i in 0 ..< players.count {
        if i % 3 == 0 {
            teamDragons.append(players[i])
        }
        
        if i % 3 == 1 {
            teamSharks.append(players[i])
        }
        
        if i % 3 == 2 {
            teamRaptors.append(players[i])
        }
    }
}
sortPlayersIntoTeams(players: experiencedByHeight)
sortPlayersIntoTeams(players: inexperiencedByHeight)

// Showing the average height of each team using For In Loops:

func calculateAverageHeightOfTeam(players: [[String : String]]) -> Double {
    var heightArray: [Double] = []
    for player in players {
        if let heightString: String = player["height"] {
            let height = Double(heightString)
            heightArray.append(height!)
        }
    }
    
    var totalTeamHeight: Double = 0
    for height in heightArray {
        totalTeamHeight += height
    }
    
    let averageHeight = totalTeamHeight/Double(players.count)
    return averageHeight
}

calculateAverageHeightOfTeam(players: teamDragons)
calculateAverageHeightOfTeam(players: teamSharks)
calculateAverageHeightOfTeam(players: teamRaptors)

// Sending letters out to the guardians of the players containing information about which team their child is on and what time their first practice is using For In Loops:

func letterToGuardiansDragons(teamOfPlayers: [[String : String]], teamName: String) {
    for player in players {
        if let guardians = player["guardians"],
        let name = player["name"] {
        let teamDragons = ("Team Dragons")
        let practiceTime = ("March 17th at 1:00 PM")
            
            print("Dear \(guardians), \n We have great news! \(name) has been chosen to play on \(teamDragons) this season! \n Our first practice is going to be held on \(practiceTime). We can't wait to see you there!")
        }
    }
}

func letterToGuardiansSharks(teamOfPlayers: [[String : String]], teamName: String) {
    for player in players {
        if let guardians = player["guardians"],
        let name = player["name"] {
        let teamSharks = ("Team Sharks")
        let practiceTime = ("March 17th at 3:00 PM")
        
        print("Dear \(guardians), \n We have great news! \(name) has been chosen to play on \(teamSharks) this season! \n Our first practice is going to be held on \(practiceTime). We can't wait to see you there!")
        }
    }
}


func letterToGuardiansRaptors(teamOfPlayers: [[String : String]], teamName: String) {
    for player in players {
        if let guardians = player["guardians"],
            let name = player["name"] {
        let teamRaptors = ("Team Raptors")
        let practiceTime = ("March 18th at 1:00 PM")
        
        print("Dear \(guardians), \n We have great news! \(name) has been chosen to play on \(teamRaptors) this season! \n Our first practice is going to be held on \(practiceTime). We can't wait to see you there!")
        }
    }
}

letterToGuardiansDragons(teamOfPlayers: teamDragons, teamName: " Team Dragons")
letterToGuardiansSharks(teamOfPlayers: teamSharks, teamName: "Team Sharks")
letterToGuardiansRaptors(teamOfPlayers: teamRaptors, teamName: "Team Raptors")

// Collection of the letters in an array:

let letters = [letterToGuardiansDragons, letterToGuardiansSharks, letterToGuardiansRaptors]
