import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldString = ""
    
    var body: some View {
            ScrollView {
                VStack {
                    TextField("Write a new task here...", text: $textFieldString)
                        .padding(.horizontal)
                        .frame(height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.blue, lineWidth: 3)
                        )
                        .cornerRadius(10)
                    Button(action: saveButtonPressed, label: {
                        Text("Save")
                            .foregroundStyle(Color.white)
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                    })
                }
                .padding(16)
            }
            .navigationTitle("Add a new task 🖋️")
        }
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldString)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddView()
        .environmentObject(ListViewModel())
}
