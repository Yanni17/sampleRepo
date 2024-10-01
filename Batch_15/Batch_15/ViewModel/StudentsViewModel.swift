//
//  StudentsViewModel.swift
//  Batch_15
//
//  Created by Ioannis Pechlivanis on 22.08.24.
//

import SwiftUI
import Observation


@Observable class StudentsViewModel {
  
    init(){
        fetchStudents()
        
    }
    
    
    func fetchStudents() {
        do {
            self.students = try container.context.fetch(Student.fetchRequest())
        } catch {
            print("Error")
        }
    }
    
    func saveStudent(name: String) {
        let student = Student(context: container.context)
        student.id = UUID()
        student.name = name
        
        saveAndFetch()
    }
    
    func deleteStudent(student: Student) {
        container.context.delete(student)
        
        saveAndFetch()
    }
    
    func saveAndFetch(){
        container.save()
        fetchStudents()
    }
    
    private(set) var students: [Student] = []
    
    private let container = PersistentStore.shared
}
