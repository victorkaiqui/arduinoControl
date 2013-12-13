package arduinocontrol

class IndexController {

     def index() { 
        [objList: Lamp.findAll(), clusterList : Cluster.findAll()] 
    }
}
