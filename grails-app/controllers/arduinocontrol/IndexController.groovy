package arduinocontrol

class IndexController {

     def index() { 
        [objList: Lamp.findAll()] 
    }
}
