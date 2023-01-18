//
//  CharacterRepository.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import RealmSwift

class CharacterRepository {
    
    private var apiRestMarvel: ApiRestMarvel?
    private var characterDao: CharacterDao
    private var isLastPage: Bool = false
    private var page = 0
    
    init(apiRestMarvel: ApiRestMarvel?, characterDao: CharacterDao) {
        self.apiRestMarvel = apiRestMarvel
        self.characterDao = characterDao
    }
    
    /// Obtenemos un personaje por Id
    ///  - Parameter id: Int: se utiliza para filtrar la busqueda del personaje
    ///  - Parameter completion: Character: obtenemos el personaje o ´nil´
    func getCharacter(id: Int, completion: @escaping (Character?) -> Void) {
        
        //Hacemos la consulta desde el WS
        self.apiRestMarvel?.getCharacter(id: id)?.responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                guard let apiObject = ApiObjectCharacterDataWrapper.build(with: response, to: ApiObjectCharacterDataWrapper.self) else {
                    Log.debug("getCharacter id: \(id) - Ok without data")
                    return
                }
                
                Log.debug("getCharacter id: \(id) - Ok with data")
    
                //Actualizamos la base de datos con la informacion obtenida del WS
                let assamble = CharacterAssambler(characterDao: self.characterDao)
                assamble.assamble(apiObject: apiObject)

            case .failure(let error):
                Log.error("getCharacter id: \(id) - Fail \(error.localizedDescription)")
            }
            
            //Retornamos el valor que tengamos en base de datos
            completion(self.characterDao.getCharacter(id: id))
        })
    }
    
    /// Obtenemos el listado de personajes paginado
    ///  - Parameter ionFirstPaged: Bool: se utiliza para gestionar la paginacion (solo la primera pagina debe ser true)
    ///  - Parameter completion: (Results<Character>?, Bool): obtenemos el listado de personajes o ´nil´ y un Boolean indicando si es la ultima página
    func getCharacters(onFirstPage: Bool? = false, completion: @escaping (Results<Character>?, Bool) -> Void) {
        
        if onFirstPage == true {
            //Reseteamos el paginador para comenzar desde la primera página
            self.page = 0
            self.isLastPage = false
        } else {
            //Actualizamos para obtener el listado de la siguiente página
            self.page = self.page + 1
        }
        
        //Hacemos la consulta desde el WS
        self.apiRestMarvel?.getCharacters(limit: ApiRestMarvel.LIMIT_PER_PAGE, page: self.page)?.responseJSON(completionHandler: { response in
            switch response.result {
            case .success:
                guard let apiObject = ApiObjectCharacterDataWrapper.build(with: response, to: ApiObjectCharacterDataWrapper.self) else {
                    Log.debug("getCharacter - Ok without data")
                    return
                }
                
                Log.debug("getCharacter - Ok with data")
                
                //Actualizamos la base de datos con la informacion obtenida del WS
                let assamble = CharacterAssambler(characterDao: self.characterDao)
                assamble.assamble(apiObject: apiObject, isFirstPage: self.page == 0)
                
                //Actualizamos para saber si no tenemos mas datos que leer con la paginacion
                self.isLastPage = apiObject.data?.count == 0 ? true : false

            case .failure(let error):
                Log.error("getCharacter - Fail \(error.localizedDescription)")
            }
            
            //Retornamos el valor que tengamos en base de datos
            completion(self.characterDao.getCharacters(), self.isLastPage)
        })
    }
    
}

