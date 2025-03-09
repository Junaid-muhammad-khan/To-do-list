//
//  ContentView.swift
//  To-do list
//
//  Created by Junaid Muhammad Khan on 2025-03-08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
                topBar()
                list()
        }
    }
}
struct list: View {
    @State private var tasks: [String] = []
    @State private var newTask = ""
    var body: some View {
        VStack {
                    TextField("Enter a task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    List {
                        ForEach(tasks, id: \.self) { task in
                            Text(task)
                        }
                        .onDelete { indexSet in
                            tasks.remove(atOffsets: indexSet)
                        }
                    }
                }
    }
}
struct topBar: View {
    var body: some View {
        HStack{
            Text("To-do list")
                .bold()
            Spacer()
            ellipsis()
            
        }
    }
}
struct ellipsis: View {
    @State private var showMenu = false
    var body: some View {
        Button(action: {
            showMenu = true
        }){
            Label("", systemImage: "ellipsis")
                .foregroundStyle(.black)
                .ignoresSafeArea()
                .cornerRadius(10)
                
            }
        .sheet(isPresented: $showMenu, content: {
            DropdownMenu()
        })
            
        }
    }

struct DropdownMenu: View {
    var body: some View {
        VStack{
            List{
                Button(action: {
                    // tap code
                }){
                    Label("Add", systemImage: "plus")
                        .foregroundStyle(.black)
                        .ignoresSafeArea()
                        .cornerRadius(10)
                        
                    }
                EditButton()
                }
            }
        }
    }

//#Preview {
//    ContentView()
//}
