//
//  ApiRestMarvel.swift
//  Marvel
//
//  Created by Santiago Pereira on 16/1/23.
//

import Alamofire

class ApiRestMarvel: ApiRestClient {
    
    private let API_PREFIX = "v1/public"
    
    /// Obtiene listas de personajes de historietas con filtros opcionales
    ///  - Parameter limit: Int: se utiliza para incluir solo los N primeros elementos de una colección de recursos
    ///  - Parameter page: Int: paginación basada en desplazamiento
    ///  - Returns: `DataRequest` o nil
    func getCharacters(limit: Int, page: Int) -> DataRequest? {
        var serviceURL: String = API_PREFIX
        serviceURL = serviceURL + "/characters"
        serviceURL = serviceURL + "?orderBy=name"
        serviceURL = serviceURL + "&offset=\(page)"
        serviceURL = serviceURL + "&limit=\(limit)"
        return self.get(service: serviceURL)
    }
}
