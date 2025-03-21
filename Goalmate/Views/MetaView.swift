import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    let title: String
    let date: String
}

struct MetaView: View {
    @State private var showAddMetaView = false
    @State private var goals: [Goal] = [
        Goal(title: "Prova de Português", date: "08/06/2025"),
        Goal(title: "ENEM", date: "08/06/2025")
    ]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Metas")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    Button(action: {
                        showAddMetaView = true
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                    .sheet(isPresented: $showAddMetaView) {
                        AddMetaView { newGoal in
                            goals.append(newGoal) // Adiciona a nova meta à lista
                        }
                    }
                }
                .padding()
                
                List(goals) { goal in
                    HStack {
                        Text(goal.title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Text(goal.date)
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .listStyle(PlainListStyle())

                Spacer()

                BottomNavigationView()
            }
        }
    }
}
