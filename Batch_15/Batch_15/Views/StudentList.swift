//
//  StudentList.swift
//  Batch_15
//
//  Created by Ioannis Pechlivanis on 22.08.24.
//

import SwiftUI

struct StudentList: View {
    
    @State private var viewModel = StudentsViewModel()
    @State var presentingSheet = false
    @State var name = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.students) { student in
                    Text(student.name ?? "")
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button {
                                viewModel.deleteStudent(student: student)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        presentingSheet.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $presentingSheet) {
                NavigationStack {
                    Form {
                        Section {
                            TextField("Name", text: $name)
                                .autocorrectionDisabled()
                        }
                        Section {
                            Button {
                                viewModel.saveStudent(name: name)
                                presentingSheet.toggle()
                            } label: {
                                Text("save")
                            }
                        }
                    }
                    .navigationTitle("Add Student")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationTitle("#Batch15")
        }
    }
}

#Preview {
    StudentList()
}
