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
                //Section creates a "white globe" around all input field
                //used divide fields
                Section(header: Text("Book details")) {
                    // a plain text field
                    TextField("Title of the book", text: $workingBook.title)
                    TextField("Author", text: $workingBook.author)
                    //Picker is like a dropdown
                    Picker("Genre", selection: $workingBook.genre){
                        ForEach(Genre.allCases, id: \.self) { genre in
                            //Text is the displayed text and the .tag is a modifier with the actual value saved
                            Text(genre.rawValue).tag(genre)
                        }
                    }
                    //This is like a textarea
                    TextEditor(text: $workingBook.details)
                        .frame(height: 150)
                }
                Section(header: Text("My review")) {
                    Picker("Rating", selection: $workingBook.rating){
                        //special base case
                        Text("No rating").tag(0)
                        //case from 1 to 5
                        ForEach(1...5, id: \.self) { rating in
                            Text("\(rating)").tag(rating)
                        }
                    }
                    Picker("Reading status", selection: $workingBook.status){
                        //Enums have a special property allCasses
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    TextEditor(text: $workingBook.review)
                        .frame(height: 150)
                }
            }
            .navigationBarTitle(titleText)
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        dismiss()
                        self.$bookToEdit.wrappedValue = self.workingBook
                    }.disabled(workingBook.title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }
    }
}
