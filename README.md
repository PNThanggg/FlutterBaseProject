## Project Structure

```
|-- lib
    |-- main.dart
    |-- build_constants.dart    
    |-- main_dev.dart
    |-- main_prod.dart
    |-- presentation          ---> application/feature layer
        |-- base                ---> bass class
        |-- views             ---> UI of the app
            |-- screens         ---> pages or screens
            |-- widget          ---> custom widgets
            |-- resources       ---> defind the resources like: color, style, ...
        |-- route           ---> optional application navigator
    |-- domain                ---> domain layer
        |-- entities            ---> enterprise entitie
        |-- enums               ---> support to interact with data easier
        |-- repositories        ---> abstract class that define functionality get data
        |-- use_cases           ---> business processes
    |-- data                  ---> data layer      
        |-- remote              ---> handle remote data
            |-- repositories  
        |-- local               ---> handle local storage persistance
    |-- di                    ---> Dependency Inversion
    |-- res                   ---> image, string, font
```
