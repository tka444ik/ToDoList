import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                Text("There are no tasks!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("I think you should click the add button and add a bunch of tasks 👀")
                    .font(.title3)
                    .fontWeight(.light)
                NavigationLink(destination: AddView()) {
                    Text("Add a task")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 10)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .padding(.vertical, 150)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemsView()
}
