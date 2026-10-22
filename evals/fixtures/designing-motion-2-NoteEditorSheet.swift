import SwiftUI

// Notes app. "New Note" opens the editor sheet (a few times a day).
// There are no motion tokens in the project yet.
struct NotesHome: View {
    @State private var showEditor = false
    @State private var dragOffset: CGFloat = 0
    @State private var saveLabel = "Save"
    @State private var labelPop = false
    @State private var showSavedToast = false
    @State private var displayedWords = 0
    let wordCount: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            NotesList()

            Button("New Note") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) { showEditor = true }
            }

            if showEditor {
                VStack {
                    HStack {
                        Button("Close") { withAnimation(.easeIn(duration: 0.5)) { showEditor = false } }
                        Spacer()
                        // Word count: ticks up from 0 every time the sheet opens
                        Text("\(displayedWords) words")
                            .onAppear {
                                displayedWords = 0
                                Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { t in
                                    if displayedWords < wordCount { displayedWords += 1 } else { t.invalidate() }
                                }
                            }
                        Button {
                            saveLabel = "Saved"
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) { labelPop = true }
                            showSavedToast = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { showSavedToast = false }
                        } label: {
                            Text(saveLabel).scaleEffect(labelPop ? 1.3 : 1)
                        }
                    }
                    EditorBody()
                }
                .offset(y: dragOffset)
                .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity))
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            // The sheet does not move while dragging; it only reacts after the finger lifts.
                            withAnimation(.easeIn(duration: 0.5)) {
                                if value.translation.height > 250 { showEditor = false }
                                dragOffset = 0
                            }
                        }
                )
            }

            if showSavedToast {
                Text("Saved").padding().transition(.opacity)
            }
        }
    }
}
