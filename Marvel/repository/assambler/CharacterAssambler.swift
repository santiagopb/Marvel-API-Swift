//
//  CharacterAssambler.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterAssambler {
    private var characterDao: CharacterDao
    
    init(characterDao: CharacterDao) {
        self.characterDao = characterDao
    }
    
    func assamble(apiObject: ApiObjectCharacterDataWrapper, isFirstPage: Bool = false) {
        guard let _characters = apiObject.data?.results else { return }
        
        if isFirstPage {
            _ = characterDao.removeCharacters()
        }
        
        var objects: [Object] = []
        
        for _item in _characters {
            if let character = Character.build(apiObject: _item) {
                
                if let urls = getUrls(from: _item) {
                    character.urls.append(objectsIn: urls)
                    objects.append(contentsOf: urls)
                }
                
                if let image = Image.build(apiObject: _item.thumbnail) {
                    character.thumbnail = image
                    objects.append(image)
                }
                
                if let comicList = ComicList.build(apiObject: _item.comics) {
                    if let comicSummary = getComicSummary(from: _item) {
                        comicList.items.append(objectsIn: comicSummary)
                        objects.append(contentsOf: comicSummary)
                    }
                    character.comics = comicList
                    objects.append(comicList)
                }
                
                if let storyList = StoryList.build(apiObject: _item.stories) {
                    if let storySummary = getStorySummary(from: _item) {
                        storyList.items.append(objectsIn: storySummary)
                        objects.append(contentsOf: storySummary)
                    }
                    character.stories = storyList
                    objects.append(storyList)
                }
                
                if let eventList = EventList.build(apiObject: _item.events) {
                    if let eventSummary = getEventSummary(from: _item) {
                        eventList.items.append(objectsIn: eventSummary)
                        objects.append(contentsOf: eventSummary)
                    }
                    character.events = eventList
                    objects.append(eventList)
                }
                
                if let seriesList = SeriesList.build(apiObject: _item.series) {
                    if let seriesSummary = getSeriesSummary(from: _item) {
                        seriesList.items.append(objectsIn: seriesSummary)
                        objects.append(contentsOf: seriesSummary)
                    }
                    character.series = seriesList
                    objects.append(seriesList)
                }
                
                objects.append(character)
            } else {
                Log.error("Fail building Character with data \(_item)")
            }
        }
        
        characterDao.addObjects(with: objects)
    }
    
    func assamble(apiObject: ApiObjectCharacter) {
        
    }
    
    private func getUrls(from apiObject: ApiObjectCharacter) -> [Url]? {
        var data: [Url] = []
        
        apiObject.urls?.forEach({ _item in
            if let object = Url.build(apiObject: _item) {
                data.append(object)
            }
        })
        
        return data.count > 0 ? data : nil
    }
    
    private func getComicSummary(from apiObject: ApiObjectCharacter) -> [ComicSummary]? {
        var data: [ComicSummary] = []
        
        apiObject.comics?.items?.forEach({ _item in
            if let object = ComicSummary.build(apiObject: _item) {
                data.append(object)
            }
        })
        
        return data.count > 0 ? data : nil
    }
    
    private func getStorySummary(from apiObject: ApiObjectCharacter) -> [StorySummary]? {
        var data: [StorySummary] = []
        
        apiObject.stories?.items?.forEach({ _item in
            if let object = StorySummary.build(apiObject: _item) {
                data.append(object)
            }
        })
        
        return data.count > 0 ? data : nil
    }
    
    private func getEventSummary(from apiObject: ApiObjectCharacter) -> [EventSummary]? {
        var data: [EventSummary] = []
        
        apiObject.events?.items?.forEach({ _item in
            if let object = EventSummary.build(apiObject: _item) {
                data.append(object)
            }
        })
        
        return data.count > 0 ? data : nil
    }
    
    private func getSeriesSummary(from apiObject: ApiObjectCharacter) -> [SeriesSummary]? {
        var data: [SeriesSummary] = []
        
        apiObject.series?.items?.forEach({ _item in
            if let object = SeriesSummary.build(apiObject: _item) {
                data.append(object)
            }
        })
        
        return data.count > 0 ? data : nil
    }
    
}
