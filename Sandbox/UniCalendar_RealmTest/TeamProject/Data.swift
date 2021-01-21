import Foundation
import RealmSwift

class API {
    static let shared = API()
    
    let realm = try! Realm()
    
    func callEventList()->Results<EventList>{
        let event = callEvent()
        return realm.objects(EventList.self)
    }
    
    func callEvent() -> Results<Event>{
        let subEvent = callSubEvent()
        return realm.objects(Event.self)
    }
    
    func callCategory() -> Results<Category>{
        let event = callEvent()
        return realm.objects(Category.self)
    }
    
    func callSubEvent() -> Results<SubEvent>{
        return realm.objects(SubEvent.self)
    }
    
    func callContent() -> Results<Content>{
        return realm.objects(Content.self)
    }
    //let callEventList = realm.objects(EventList.self)
    
//    func add() {
//        
//    }
    
}

class Category: Object {
    @objc dynamic var categoryName: String = ""
    @objc dynamic var categoryColor: Int = 0
    
    let eventsInCategory = List<Event>()
}

class EventList: Object {
    let events = List<Event>()
}

class Event: Object {
    @objc dynamic var eventName: String = ""
    @objc dynamic var eventDday: Date = Date.init()
    @objc dynamic var importance: Int = 0
    @objc dynamic var eventIsDone: Bool = false

    let subEvents = List<SubEvent>()
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "eventsInCategory")
    var parentEventList = LinkingObjects(fromType: EventList.self, property: "events")
}

class SubEvent: Object {
    @objc dynamic var subEventName: String = ""
    @objc dynamic var subEventIsDone: Bool = false
    
    var parentEvent = LinkingObjects(fromType: Event.self, property:"subEvents")
}

class Content: Object {
    @objc dynamic var firstContent: String = ""
    @objc dynamic var secondContent: String = ""
    @objc dynamic var thirdContent: String = ""
}

