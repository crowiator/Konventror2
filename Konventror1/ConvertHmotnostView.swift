//
//  ConvertHmotnostView.swift
//  Konventror1
//
//  Created by crow on 08/03/2023.
//

import SwiftUI

enum HmotnostneJednotky: String, CaseIterable{
    case tona = "t"
    case metrickyCent = "q"
    case kilogram = "kg"
    case dekagram = "dag"
    case gram = "g"
    case miligram = "mg"
}

struct ConvertHmotnostView: View {
    @State private var zadanaHmotnost: Double = 1
    
    @State private var vstupnaHmotnost: HmotnostneJednotky = .miligram
    
    var vstupnaHmotnostMG:Double {
        switch vstupnaHmotnost{
        case .tona:
            return zadanaHmotnost * 1_000_000_000
        case .metrickyCent:
            return zadanaHmotnost * 100_000_000
        case .kilogram:
            return zadanaHmotnost * 1_000_000
        case .dekagram:
            return zadanaHmotnost * 10_000
        case .gram:
            return zadanaHmotnost * 1000
        case .miligram:
             return zadanaHmotnost
        }
        
    }
    
    var body: some View {
        Form {
            //vlozenie cisla
            Section("Zadaj hmotnost"){
                TextField("Vlož Objem", value: $zadanaHmotnost, format: .number)
                    .keyboardType(.decimalPad)
                
                //menu na vyber jednotky
                Picker("Vyber vstupnu hmotnost", selection: $vstupnaHmotnost) {
                    ForEach(HmotnostneJednotky.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
                
             //vypis
            Section("Hmotnostne  jednotky"){
                ForEach(HmotnostneJednotky.allCases, id: \.self){ jednotka in
                    let hmotnostVypis = premen(vstupnaHmotnostMG, output: HmotnostneJednotky(rawValue: jednotka.rawValue)!)
                    
                    Text("\(hmotnostVypis, specifier: "%.2f") \(jednotka.rawValue)")
                }
            }
          }
        .navigationTitle("Hmotnost")
        }
    
    
    //funkcia na premenu jednotiek
    func premen(_ vstup:Double, output: HmotnostneJednotky)-> Double {
        switch output {
        case .tona:
            return vstup / 1_000_000_000
        case .metrickyCent:
            return vstup / 100_000_000
        case .kilogram:
            return vstup / 1_000_000
        case .dekagram:
            return vstup / 10_000
        case .gram:
            return vstup / 1000
        case .miligram:
             return vstup
        }
    }
}

struct ConvertHmotnostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertHmotnostView()
    }
}
