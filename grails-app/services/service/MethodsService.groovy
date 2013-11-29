package service

import serial.SerialCommunication

class MethodsService {

    SerialCommunication sc = new SerialCommunication()
    
    def initSerial() {
        Config c = Config.findByEnabled(true)
        sc.initSerial(c.port , c.rate.getRate())       
    }

    def close() {       
        sc.close()
    }
    
    def onOrOff(Object o) {
        
    }
}
