// Pacer (fitness tracker, iPhone and iPad). Every sheet in the app, excerpted.
// The kit's grabber is 5 pt tall and sits 8 pt from the sheet's top edge.
import SwiftUI

struct AddWorkoutSheet: View {          // reported: "content starts lower than the others"
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Grabber()                          // drawn inside the VStack
      Text("Add workout").font(.title3.weight(.semibold))
      WorkoutTypeCard()
    }
    .padding(.top, 32)                   // grabber not counted: text lands at 32 + 8 + 5 + 16 = 61
    .padding(.horizontal, 20)
  }
}

struct EditGoalSheet: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      GoalCard()
    }
    .padding(.top, 24)                   // presentationDragIndicator(.visible); grabber paid for inside the 24
    .padding(.horizontal, 16)
    .presentationDragIndicator(.visible)
  }
}

struct FilterSheet: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Filter").font(.headline)     // heading uses .headline here, .title3 elsewhere
      FilterOptionsCard()
    }
    .padding(.top, 32)
    .padding(.horizontal, 16)
    .presentationDragIndicator(.visible)
  }
}

struct ShareRouteSheet: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("Share route").font(.title3.weight(.semibold))
      ShareOptionsCard()
    }
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .presentationDragIndicator(.hidden)  // no grabber at all
  }
}

struct RestTimerSheet: View {
  var body: some View {
    VStack(spacing: 24) {
      TimerDial()
    }
    .padding(.top, 24)
    .padding(.horizontal, 16)
    .presentationDragIndicator(.visible)
    .interactiveDismissDisabled()        // decisions log D-11: rest timer cannot be swiped away mid-set
  }
}
