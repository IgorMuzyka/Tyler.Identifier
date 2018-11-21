
import Foundation

public struct Identifier: Hashable, Equatable {

    private let rawValue: String

    public init() {
		rawValue = Identifier.fresh()
    }
}

extension Identifier: Codable {

	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		rawValue = try container.decode(String.self)
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}

extension Identifier: CustomStringConvertible {

    public var description: String {
        return rawValue
    }
}

extension Identifier {

	private static var counter: Int64 = 0
	private static let hashids = Hashids(salt: Bundle.main.bundleIdentifier ?? """
        The first rule of Fight Club is: You do not talk about Fight Club. The second rule of Fight Club is: You do not talk about Fight Club. Third rule of Fight Club: someone yells stop, goes limp, taps out, the fight is over. Fourth rule: only two guys to a fight. Fifth rule: one fight at a time, fellas. Sixth rule: no shirts, no shoes. Seventh rule: fights will go on as long as they have to. And the eighth and final rule: if this is your first night at Fight Club, you have to fight.
        """)

	fileprivate static func fresh() -> String {
		counter += 1

		guard let identifier = hashids.encode(counter) else { return fresh() }

		return identifier
	}
}
