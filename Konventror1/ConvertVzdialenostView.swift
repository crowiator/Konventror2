//
//  ConvertVzdialenostView.swift
//  Konventror1
//
//  Created by crow on 08/03/2023.
//

import SwiftUI

struct ConvertVzdialenostView: View {
    @State private var vstupnaVzdialenost: Double = 1
    @State private var vstupnaJednotka = "km"
    
    let vsetkyJednotky = ["km", "m", "cm", "mm", "mi", "yd", "ft", "in"]
    
    var vstupnaVzdialenostMM: Double {
        var konvertovanieNaMilimetre: Double
        switch vstupnaJednotka {
        case "km":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 1_000_000
        case "m":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 1_000
        case "cm":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 10
        case "mi":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 1_609_344
        case "yd":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 914.4
        case "ft":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 304.8
        case "in":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 25.4
        default:
            konvertovanieNaMilimetre = vstupnaVzdialenost
        }
        return konvertovanieNaMilimetre
    }
    
    var body: some View {
        Form {
            Section("Zadaj vstupne jednotky"){
                TextField("Zadaj vzdialenost", value: $vstupnaVzdialenost, format: .number) .keyboardType(.decimalPad)
                //decimalPad ->ciselna klavescnia
                //picker
                Picker("Vyber vstupnú jednotku", selection: $vstupnaJednotka) {
                    ForEach(vsetkyJednotky, id: \.self){
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                Text("\(vstupnaVzdialenostMM)")
            }
            Section("Metricke"){
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"km"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"m"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM ,output:"cm"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"mm"))
            }
            
            Section("Imperialne") {
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"mi"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"yd"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"ft"))
                Text(vypocitajVzdialenost(vstupnaVzdialenostMM, output:"in"))
                
            }
        }
        .navigationTitle("Vzdialenost")
    }
    
    
    func vypocitajVzdialenost(_ vzdialenost: Double, output: String)-> String {
        var vystup: Double
        switch output {
        case "km":
            vystup = vzdialenost / 1_000_000
        case "m":
            vystup = vzdialenost / 1_000
        case "cm":
            vystup = vzdialenost / 10
        case "mi":
            vystup = vzdialenost / 1_609_344
        case "yd":
            vystup = vzdialenost / 914.4
        case "ft":
            vystup = vzdialenost /  304.8
        case "in":
            vystup = vzdialenost /  25.4
        default:
            vystup = vzdialenost
        }
        //na 3 desatine miesta
        var textovyVystup = String(format: "%.3f",vystup)
        while textovyVystup.last == "0"{
            textovyVystup.removeLast()
        }
        if textovyVystup.last == "."{
            textovyVystup.removeLast()
        }
        return "\(textovyVystup) \(output)"
    }

}

struct ConvertVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertVzdialenostView()
    }
}

