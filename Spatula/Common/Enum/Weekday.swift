import Foundation

enum Weekday: Int {
    case mon = 1
    case tues
    case wednes
    case thurs
    case fri
    case satur
    case sun
    
    func value() -> String {
        switch self {
        case .mon: return "월"
        case .tues: return "화"
        case .wednes: return "수"
        case .thurs: return "목"
        case .fri: return "금"
        case .satur: return "토"
        case .sun: return "일"
        }
    }
}
