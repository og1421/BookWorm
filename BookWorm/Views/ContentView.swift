//
//  ContentView.swift
//  BookWorm
//
//  Created by Orlando Moraes Martins on 20/12/22.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List{
                ForEach (books) { book in
                    NavigationLink{
                        Text(book.title ?? "Unknown Title" )
                    } label: {
                        HStack{
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack (alignment: .leading){
                                Text(book.title ?? "Unknown title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showingAddScreen.toggle()
                        } label :{
                            Text("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(ispresented:$showingAddScreen){
                    AddBookView()
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}