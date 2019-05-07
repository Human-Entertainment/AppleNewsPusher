import Vapor

final class GhostController {
    func ghostAppleNewsFormat(_ req: Request) throws -> Future<HTTPStatus> {
        let client = try req.client()
        
        let channelID = "d6e13bb4-64d8-49a3-9595-ad966812f5ed"
        let channelKey = "184666b5-0e93-44d8-9353-a99abe54c495"
        let channelSignature = "dUEMHGatwvHU6SD04uew48bRzegYB7A3d4r0MJ4fDXE="
        let url = "https://news-api.apple.com/channels/\(channelID)/articles"

        var appleNewsHeaders: [String:String] = ["Authorization": "HHMAC; key=\"\(channelKey)\"; signature=\"\(channelSignature)\"; date=\"2015-03-05T03:00:27Z\""]
            appleNewsHeaders["Content-Type"] = "multipart/form-data; boundary=applenews"

        var body: String {
            var appleNewsBody: AppleNewsBody {
                let ghostBody = 
                return
            }

            var appleNewsFiles: [File]? {
                return nil
            } 

            let body = Body(
                body: appleNewsBody,
                files: appleNewsFiles
            )

            var tempBody = ["--applenews\n"]
                tempBody.append("Content-Type: application/json\n")
                tempBody.append("Content-Disposition: form-data; filename=article.json; name=article.json\n")
                tempBody.append("\(body.body)\n")
            if let files = body.files {
                for image in files {
                    tempBody.append("--applenews\n")
                    tempBody.append("Content-Type: image/jpeg\n")
                    tempBody.append("Content-Disposition: form-data; filename=\(image.name); name=\(image.name)\n")
                    tempBody.append(image.data)
                }
            }
            return tempBody.description
        }
        let httpBody = HTTPBody(string: body)
        
            appleNewsHeaders["Content-Length"] = "\(body.length)"
        
        let headers = HTTPHeaders(appleNewsHeaders.map { $0 })
        
        let request = Request(using: client.container)
        request.http.method = .POST
        request.http.headers = headers
        request.http.body = httpBody
        request.http.url = URL(string: url)!
        
        return client.send(request).map {_ in
            return .ok
        }
    }
}

struct Body: Codable {
    let body: AppleNewsBody
    let files: [File]?
}

struct Ghost: Codable {
    let id: String
    let html: String
}