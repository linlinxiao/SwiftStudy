//: Playground - noun: a place where people can play

import UIKit

/**
*  类型转换
*/
//类型检查，可以使用is,相当与在OC中使用isKindOf方法来判断是前者是不是后者的子类实例,使用as?或者as!来向下转型，如果确定下乡转型一定成功才使用as!
class MediaItem{
    var name:String
    init(name:String){
        self.name = name
    }
}

class Movie: MediaItem {
    var director:String
    init(name:String, director:String){
        self.director = director;
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist:String
    init(name:String, artist:String){
        self.artist = artist
        super.init(name: name)
    }
}

class Person {
    var name = ""
}

var mediaItems = [Movie(name: "Roamio and Juliye", director: "Smith"), Song(name: "Love You", artist: "Jewl")]
if mediaItems[0] is Movie{
    print(mediaItems[0].name)
}

for mediaItem in mediaItems{
    if let movie = mediaItem as? Movie{
        print(movie.director)
    }
    else if let song = mediaItem as? Song{
        print(song.artist)
    }
}

/**
*  Any和AnyObject,
　　　Any表示任意类型
　　　AnyObject表示任意类类型
*/
var anyobject : [AnyObject] = [AnyObject](arrayLiteral: mediaItems)
anyobject.append(Person())
for (index , item) in anyobject.enumerate() {
    if let person = item as? Person{
        print("person at index \(index)")
    }
}
var any : [Any] = [1,"hi",Movie(name: "ss", director: "hw"), 0.0, 0, 89, true]
for thing in any{
    switch thing{
    case 0 as Int:
        print("zero as Int")
    case 0 as Double:
        print("zero as Double")
    case let string as String:
        print(string)
    case let movie as Movie:
        print("movie name \(movie.name)")
    case is Bool:
        print("true")
    default:
        print("noting")
    }
}



