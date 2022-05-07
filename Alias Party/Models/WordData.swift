//
//  questions.swift
//  Alias Party
//
//  Created by Mac on 04.05.2022.
//

import Foundation

enum ActionEnum: String {
    case one = "Animals"
    case two = "Hats"
    case three = "Science"
    case four = "Music Theory"
}

struct WordData {
    
    static let one: Set<String> = ["Velociraptor", "gazelle", "gibbon", "gorilla", "grasshopper", "javelina", "jellyfish", "jerboa", "joey", "junco", "falcon", "Eoraptor", "Edenta", "deer", "cat", "conch", "bobcat", "bebrik", "blowfish", "collie", "crab", "crayfish", "crocodile", "dog", "fox", "frog", "grouper", "lobster", "lynx", "moth", "nandu", "ocelot", "onager", "numbat", "nest", "penguin", "peafowl", "pelican", "pigeon", "pika", "piranha", "plover", "rat", "rattlesnake", "red wolf", "red kangaroo", "sailfish", "silverfish", "slug", "snail", "snake", "sparrow", "softshell turtle", "sunfish", "swift", "swan", "swallowtail butterfly", "thrip", "tiger", "toad", "toucan", "treefrog", "turkey", "ungulates", "Utahraptor", "wild cat", "wildebeest", "zebra", "zebra bullhead shark", "zooplankton", "zorilla", "snow leopard", "snowy owl", "donkey", "dove", "duck", "dung beetle", "dog", "eland", "elephant", "emperor penguin", "emperor angelfish", "emerald tree boa", "flying fish", "forest giraffe", "fowl", "alpaca", "albatross", "amphibian", "anaconda", "anole", "asp", "aye-aye", "assassin bug", "angonoka", "amoeba", "American crocodile", "American golden plover", "arctic wolf", "armadillo", "arctic fox", "ape", "blue jay", "blue morpho butterfly", "blue whale", "bluebird"]
    
    static let two: Set<String> = ["Akubra", "alpine hat", "balaclava", "Balmoral", "baseball cap", "batting helmet", "beanie", "bearskin hat", "beret", "bicorne", "biretta", "boater", "bonnet", "bowler", "cap", "chapeau", "chef's hat", "cloche", "coonskin hat", "cowboy hat", "cricket helmet", "crown", "cycling helmet", "deerstalker", "derby", "diving helmet", "dunce cap", "engineer's cap", "equestrian helmet", "fedora", "fez", "flat cap", "football helmet", "glengarry", "hard hat", "hat", "headdress", "helmet", "homburg", "jester's hat", "Juliet cap", "knit cap", "miter", "mortarboard", "motocross helmet", "nightcap", "Panama hat", "pillbox hat", "pith helmet", "pork pie", "rain hat", "riding cap", "ski cap", "ski helmet", "skull cap", "snood", "sombrero", "space helmet", "stovepipe hat", "straw hat", "sun bonnet", "sun hat", "swim cap", "tam", "tam o'shanter", "ten-gallon hat", "tiara", "top hat", "toque", "tricorne", "turban", "Viking helmet", "visor", "watch cap", "witch's hat", "yarmulke", "zucchetto"]
    
    static let three: Set<String> = ["astronomy", "astrophysics", "atom", "beaker", "biochemistry", "biology", "botany", "Bunsen burner", "burette", "cell", "chemical", "chemistry", "climate", "climatologist", "cuvette", "data", "datum", "electricity", "electrochemist", "element", "energy", "evolution", "experiment", "fact", "flask", "fossil", "funnel", "genetics", "geology", "geophysics", "glassware", "graduated cylinder", "gravity", "herpetology", "hypothesis", "ichthyology", "immunology", "lab", "laboratory", "laws", "lepidoptery", "magnetism", "mass", "matter", "measure", "microscope", "mineral", "mineralogy", "molecule", "motion", "observatory", "observe", "organism", "ornithology", "paleontology", "particle", "Petri dish", "phase", "physical science", "physics", "ctrl+c", "ctrl+v", "pipette", "quantum mechanics", "radiology", "research", "retort", "scale", "science", "scientist", "seismology", "telescope", "temperature", "test tube", "theory", "thermometer", "tissue", "variable", "virologist", "volcanology",]
    
    static let four: Set<String> = ["accelerando", "accent", "adagio", "Aeolian mode", "allegretto", "allegro", "andante", "andantino", "animato", "arioso", "arpeggio", "bar", "bass", "beat", "blues", "breath mark", "cadence", "canon", "cantabile", "chord", "chromatic scale", "circle of fifths", "clef", "coda", "con brio", "counterpoint", "eighth note", "eighth rest", "espressivo", "fermata", "fifth", "fine", "flag", "flat", "forte", "fortissimo", "forzando", "fourth", "grandioso", "harmonic major", "harmonic minor", "harmonics", "harmony", "hemidemisemiquaver", "key signature", "ledger line", "legato", "lento", "libretto", "melody", "meter", "mezzo forte", "mezzo piano", "minim", "minor third", "Mixolydian mode", "modulation", "molto", "music", "natural", "natural minor", "notation", "octatonic", "octave", "opera", "ornament", "overtone", "pentatonic", "pentatonic scale", "phrase", "pianissimo", "piano", "pizzicato", "prestissimo", "scherzo", "segno", "semiquaver", "semplice", "sempre", "subito",]
    
}

struct Word {
    
    static func getWords(action: ActionEnum) -> Set<String> {
        switch action {
        case .one: return WordData.one
        case .two: return WordData.two
        case .three: return WordData.three
        case .four: return WordData.four
        }
    }
    
}


