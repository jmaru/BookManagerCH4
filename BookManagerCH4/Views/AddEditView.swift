//
//  AddEditView.swift
//  BookManagerCH4
//
//  Created by Jorge Gabriel Marin Urias on 11/25/25.
//
import SwiftUI

struct AddEditView: View {
    
    @Binding var bookToEdit: Book
    @State var workingBook: Book
    @Environment(\.dismiss) var dismiss
    
    
    private var titleText: String
    
    //this is run only one time at creation
    init(bookToEdit: Binding<Book>){

        self._bookToEdit = bookToEdit
        self._workingBook = .init(initialValue: bookToEdit.wrappedValue)
        self.titleText = bookToEdit.wrappedValue.title.isEmpty ? "Add book" : "Edit book"
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $workingBook.title)
                TextField("Author", text: $workingBook.author)
                TextEditor(text: $workingBook.details)
                    .frame(minHeight: 150)
            }
            .navigationBarTitle(titleText)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                        self.$bookToEdit.wrappedValue = self.workingBook
                    }.disabled(workingBook.title.isEmpty)
                }
            }
        }
    }
}
