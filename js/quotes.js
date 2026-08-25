.pragma library

var ALL = [
  { character: "Tony Soprano", short: "Tony", text: "It's good to be in something from the ground floor. I came too late for that, I know. But lately, I'm getting the feeling that I came in at the end. The best is over.", episode: "Pilot" },
  { character: "Tony Soprano", short: "Tony", text: "Those who want respect, give respect.", episode: "The Knight in White Satin Armor" },
  { character: "Tony Soprano", short: "Tony", text: "I'm like King Midas in reverse. Everything I touch turns to shit.", episode: "Isabella" },
  { character: "Tony Soprano", short: "Tony", text: "You know where I was going with that, with the ducks? I was afraid I was gonna lose my family.", episode: "Pilot" },
  { character: "Tony Soprano", short: "Tony", text: "All due respect, you got no idea what it's like to be Number One. Every decision you make affects every facet of every other fella's life.", episode: "All Due Respect" },
  { character: "Tony Soprano", short: "Tony", text: "What kind of person can I be, where his own mother wants him dead?", episode: "I Dream of Jeannie Cusamano" },
  { character: "Tony Soprano", short: "Tony", text: "Even a broken clock is right twice a day.", episode: "Pax Soprana" },
  { character: "Tony Soprano", short: "Tony", text: "There's no chemical solution to a spiritual problem.", episode: "The Strong, Silent Type" },
  { character: "Tony Soprano", short: "Tony", text: "I don't care how close you are. In the end, your friends are gonna let you down. Family too. It's a fact of life.", episode: "Members Only" },
  { character: "Tony Soprano", short: "Tony", text: "It's not a nursing home. How many times do I gotta say this? It's a retirement community.", episode: "Pilot" },
  { character: "Tony Soprano", short: "Tony", text: "Those other guys \u2014 Sil, Paulie \u2014 one thing they're not: they're not my blood.", episode: "Everybody Hurts" },
  { character: "Tony Soprano", short: "Tony", text: "You don't gotta love me, but you will respect me.", episode: "The Happy Wanderer" },
  { character: "Carmela Soprano", short: "Carmela", text: "More is lost by indecision than by wrong decisions.", episode: "Whitecaps" },
  { character: "Carmela Soprano", short: "Carmela", text: "What's different between you and me is you're going to hell when you die.", episode: "Second Opinion" },
  { character: "Carmela Soprano", short: "Carmela", text: "You took an oath, Tony. I took one too.", episode: "Whitecaps" },
  { character: "Carmela Soprano", short: "Carmela", text: "I wanted more than this. I still do.", episode: "Second Opinion" },
  { character: "Carmela Soprano", short: "Carmela", text: "You are not going to destroy this family.", episode: "Whitecaps" },
  { character: "Christopher Moltisanti", short: "Chrissy", text: "You ever feel like nothin' good was ever gonna happen to you?", episode: "The Legend of Tennessee Moltisanti" },
  { character: "Christopher Moltisanti", short: "Chrissy", text: "The federal government has no idea how much it costs to live in this country.", episode: "The Knight in White Satin Armor" },
  { character: "Christopher Moltisanti", short: "Chrissy", text: "This is the life we chose.", episode: "Long Term Parking" },
  { character: "Christopher Moltisanti", short: "Chrissy", text: "I think about that steak and cheese, and I think about you. That's a good sandwich.", episode: "The Legend of Tennessee Moltisanti" },
  { character: "Christopher Moltisanti", short: "Chrissy", text: "I don't want to be a loser, Tone.", episode: "The Strong, Silent Type" },
  { character: "Paulie Gualtieri", short: "Paulie", text: "He never had the makings of a varsity athlete.", episode: "He Is Risen" },
  { character: "Paulie Gualtieri", short: "Paulie", text: "You ever notice you never see baby pigeons? You ever see a baby pigeon? That's because they're born rats.", episode: "The Weight" },
  { character: "Paulie Gualtieri", short: "Paulie", text: "The guy was an interior decorator.", episode: "Pine Barrens" },
  { character: "Paulie Gualtieri", short: "Paulie", text: "That's why dinosaurs don't exist no more.", episode: "Christopher" },
  { character: "Paulie Gualtieri", short: "Paulie", text: "In the midst of death, we are in life. Or is it the other way around?", episode: "From Where to Eternity" },
  { character: "Paulie Gualtieri", short: "Paulie", text: "Yeah. And nothin' did. So what?", episode: "The Legend of Tennessee Moltisanti" },
  { character: "Silvio Dante", short: "Sil", text: "Just when I thought I was out, they pull me back in.", episode: "The Weight" },
  { character: "Silvio Dante", short: "Sil", text: "Our true enemy has yet to reveal himself.", episode: "All Due Respect" },
  { character: "Junior Soprano", short: "Junior", text: "How many times I gotta tell you? I don't want you talking about my personal business.", episode: "46 Long" },
  { character: "Junior Soprano", short: "Junior", text: "Take it easy. We're not making a western here.", episode: "Pax Soprana" },
  { character: "Junior Soprano", short: "Junior", text: "I was passed over.", episode: "Pax Soprana" },
  { character: "Livia Soprano", short: "Livia", text: "Oh, poor you.", episode: "Pilot" },
  { character: "Livia Soprano", short: "Livia", text: "I wish the Lord would take me now.", episode: "46 Long" },
  { character: "Livia Soprano", short: "Livia", text: "It's all a big nothing. What makes you think you're so special?", episode: "I Dream of Jeannie Cusamano" },
  { character: "Livia Soprano", short: "Livia", text: "I gave my life to my children on a silver platter.", episode: "Down Neck" },
  { character: "Dr. Jennifer Melfi", short: "Melfi", text: "What do you want, Tony? What do you really want?", episode: "Pilot" },
  { character: "Dr. Jennifer Melfi", short: "Melfi", text: "Feelings are feelings. They have to be felt.", episode: "Isabella" },
  { character: "Meadow Soprano", short: "Meadow", text: "Dad, you're in the Mafia.", episode: "College" },
  { character: "A.J. Soprano", short: "A.J.", text: "It's all a big nothing.", episode: "Kennedy and Heidi" },
  { character: "Janice Soprano", short: "Janice", text: "I found serenity.", episode: "The Knight in White Satin Armor" },
  { character: "Furio Giunta", short: "Furio", text: "I have a sadness. Always.", episode: "Eloise" }
]

function filtered(shortName) {
  if (!shortName || shortName === "All") return ALL
  var out = []
  for (var i = 0; i < ALL.length; i++) {
    if (ALL[i].short === shortName) out.push(ALL[i])
  }
  return out.length ? out : ALL
}

function characters() {
  var seen = {}
  var out = [{ short: "All" }]
  for (var i = 0; i < ALL.length; i++) {
    var s = ALL[i].short
    if (!seen[s]) {
      seen[s] = true
      out.push({ short: s })
    }
  }
  return out
}

function nextIndex(current, shortName) {
  var list = filtered(shortName)
  if (list.length < 2) return 0
  var i = current
  var guard = 0
  while (i === current && guard < 16) {
    i = Math.floor(Math.random() * list.length)
    guard++
  }
  return i
}

function at(index, shortName) {
  var list = filtered(shortName)
  if (!list.length) return { character: "", short: "", text: "", episode: "" }
  var i = index % list.length
  if (i < 0) i = 0
  return list[i]
}

function count(shortName) {
  return filtered(shortName).length
}
