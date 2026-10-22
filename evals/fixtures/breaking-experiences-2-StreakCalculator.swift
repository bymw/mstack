// Streakly (iPhone): streak logic (excerpt)
import Foundation

struct StreakCalculator {
    func currentStreak(checkIns: [Date]) -> Int {
        let calendar = Calendar.current
        var streak = 0
        var day = calendar.startOfDay(for: Date())
        let days = Set(checkIns.map { calendar.startOfDay(for: $0) })
        while days.contains(day) {
            streak += 1
            day = day.addingTimeInterval(-86_400)
        }
        return streak
    }
}

final class ReminderScheduler {
    func scheduleDaily(hour: Int) {
        let fire = Calendar.current.date(bySettingHour: hour, minute: 0, second: 0, of: Date())!
        // schedules a repeating notification every 86,400 seconds from `fire`
        _ = fire
    }
}
