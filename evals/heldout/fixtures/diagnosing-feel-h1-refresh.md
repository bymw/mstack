# Reading tracker: pull to refresh on the Library tab

## My notes from a screen recording (iPhone, 60 fps, stepped frame by frame)

- Frame 0: I let go after pulling down. The system refresh spinner is showing at the top.
- Frames 1 to 18: nothing changes, spinner keeps going.
- Frame 19: all book rows disappear at once, the list collapses to just the header. A second spinner appears under the "Updated ..." line.
- Frames 19 to 41: two spinners at the same time.
- Frame 42: rows come back, fading in over about 20 frames. Both spinners disappear.
- Frame 43: the "Updated just now" line gets bigger and pushes every row down by about 6 pt.

Network log for this refresh: the request took 380 ms.

## LibraryView.swift

```swift
struct LibraryView: View {
    @State private var books: [Book] = []
    @State private var isLoading = false
    @State private var lastUpdated: Date?

    var body: some View {
        List {
            if let lastUpdated {
                Text("Updated \(lastUpdated, style: .relative) ago")
                    .font(isLoading ? .caption : .headline)
            }
            if isLoading {
                ProgressView().frame(maxWidth: .infinity)
            }
            ForEach(books) { book in
                BookRow(book: book)
            }
        }
        .refreshable {
            try? await Task.sleep(for: .milliseconds(300)) // debounce
            isLoading = true
            books = []
            books = (try? await api.fetchLibrary()) ?? []
            isLoading = false
            lastUpdated = .now
        }
        .animation(.easeInOut(duration: 0.35), value: books)
        .task { books = (try? await api.fetchLibrary()) ?? [] }
    }
}
```
