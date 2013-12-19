package arduinocontrol

class IndexController {

    def methodsService

    def initSerial() {
        methodsService.initSerial()
        redirect(uri:"/")
    }

    def closeSerial() {       
        methodsService.closeSerial()
        redirect(uri:"/")
    }
    
    def restartSerial() {       
        methodsService.closeSerial()
        redirect(uri:"/")
    }
    
    def index() { 
        [objList: Lamp.findAll(), clusterList : Cluster.findAll()] 
    }
}
