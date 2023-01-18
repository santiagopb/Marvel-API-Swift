# Marvel-API-Swift
Es una aplicación creada en XCode para iOS 15. Utilizamos librerias de terceros tales como:
###### Alamofire, SwiftyBeaver, RealmSwift, SnapKit y Kingfisher

## Instalación local
Para clonar y ejecutar esta aplicación, necesitarás Git, XCode y [CocoaPods](https://cocoapods.org/) instalados en tu ordenador. Además debes contar con el API Key de [Marvel](https://developer.marvel.com/docs).

Desde la línea de comando ejecutamos:

```bash
$ git clone https://github.com/santiagopb/Marvel-API-Swift.git
$ cd Marvel-API-Swift
$ pod install
```

> **Nota**
> En XCode debemos seleccionar para abrir el fichero Marvel.xcworkspace

Al abrir la aplicación debemos configurar las variables de entorno MARVEL_PUBLIC_KEY y MARVEL_PRIVATE_KEY con los datos obtenidos de la API de [Marvel](https://developer.marvel.com/docs).

Para ello vamos a abrir el editor de esquemas, seleccionamos ejecutar (Run) en el lado izquierdo del editor y hacemos clic en el de botón Argumentos en la parte superior del editor para acceder a las variables de entorno. 

Por último utilizamos el botón Agregar (+) para agregar las variables de entorno.

![Captura de Pantalla 2023-01-18 a las 15 15 07](https://user-images.githubusercontent.com/14046000/213197553-535de18a-32c3-4453-97ec-2a0acebba7bf.png)


## Arquitectura modular (VIPER)
La arquitectura modular nos permite dividir una aplicación en varios módulos. Entendiendo que un módulo es un subconjunto de la aplicación que tiene una responsabilidad única, sólo una.
