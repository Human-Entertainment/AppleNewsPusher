// A collection of models related to the Apple News Format, as well as some 
struct AppleNewsBody: Codable {
    let version: String = "1.0"
    let identifier: String
    let title: String
    let language: String = "en"
    let layout: AppleNewsLayout
    let subtitle: String
    let metadat: AppleNewsMetadata
    let documentStyle: AppleNewsStyle
    let components: AppleNewsComponents
}

struct AppleNewsLayout: Codable {
    let columns: Int
    let width: Int
    let margin: Int
    let gutter: Int
}

struct AppleNewsMetadata: Codable {
    let excerpt: String
    let thumbnailURL: String
}

struct AppleNewsStyle: Codable {
    let backgroundColor: String
}

struct AppleNewsComponent: Codable {
    enum Roles {
        case title(text: String)
        case photo(url: URL)
    }
    let role: Roles
    let textStyle: AppleNewsTextStyle?
}

struct AppleNewsTextStyle: Codable {
    let textAlignment: String
    let fontName: String
    let fontSize: Int
    let lineHeight: Int
    let textColor: String
}
