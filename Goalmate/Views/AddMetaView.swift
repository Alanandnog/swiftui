import SwiftUI

struct AddMetaView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var metaTitle: String = ""
    @State private var metaDate: Date = Date()
    var onSave: (Goal) -> Void  // Callback para adicionar uma meta

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Adicionar Meta")
                    .font(.title)
                    .bold()

                VStack {
                    TextField("Nome da meta", text: $metaTitle)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)

                    DatePicker("Data da meta", selection: $metaDate, displayedComponents: .date)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()

                Spacer()

                HStack {
                    Button("Cancelar") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                    .padding()

                    Spacer()

                    Button("Salvar") {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "dd/MM/yyyy" // Formato de data
                        
                        let newGoal = Goal(title: metaTitle, date: formatter.string(from: metaDate))
                        onSave(newGoal) // Chama a função para adicionar a meta
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.blue)
                    .padding()
                }
                .padding()
            }
            .padding()
        }
    }
}
