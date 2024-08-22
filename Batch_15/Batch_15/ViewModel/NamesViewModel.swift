//
//  NamesViewModel.swift
//  Batch_15
//
//  Created by tebir othman on 22.08.24.
//

import Foundation

class NamesViewModel: ObservableObject {
    @Published var names: [Name] = []
    @Published var selectedName: Name? = nil
    @Published var isSpinning: Bool = false

    init() {
        addDefaultNames()
    }

    func addName(_ name: String) {
        let newName = Name(name: name)
        names.append(newName)
    }

    func selectRandomName() {
        guard !names.isEmpty else { return }
        isSpinning = true
        
        let randomIndex = Int.random(in: 0..<self.names.count)
        self.selectedName = self.names[randomIndex]
        self.isSpinning = false
        self.names.removeAll { $0.name == selectedName?.name}
        
    }

    private func addDefaultNames() {
        names = [
            Name(name: "Joscha"),
            Name(name: "René"),
            Name(name: "Kalender"),
            Name(name: "Phillip"),
            Name(name: "Antonio Z"),
            Name(name: "Yassine"),
            Name(name: "Maisam"),
            Name(name: "Amir"),
            Name(name: "Nazmi"),
            Name(name: "Michel M"),
            Name(name: "Michael F"),
            Name(name: "Daniel"),
            Name(name: "Antonio L"),
            Name(name: "Moritz"),
            Name(name: "Sandra"),
            Name(name: "Benjamin"),
            Name(name: "Tomi"),
            Name(name: "Marcel F."),
            Name(name: "Marcel S."),
            Name(name: "Mirco"),
        ]
    }
}
