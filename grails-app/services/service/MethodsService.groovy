package service

import arduinocontrol.Lamp
import arduinocontrol.Config
import serial.SerialCommunication

class MethodsService {

    SerialCommunication sc = new SerialCommunication()
    
    def initSerial() {
        
        Config c = Config.findByEnabled(true)
        
        if(c){
            sc.initSerial(c.port , c.rate.getRate())       
        }
    }

    def closeSerial() {       
        sc.close()
    }
    
    def writeData(byte[] data){
        sc.writeData(data)
    }
    
    def complete(String s, int i){        
        
        String newString = ""
        
        if(s.length() < i){
            int aux = i - s.length()            
            while(aux != 0){
                newString += "0"
                aux--
            }            
            newString += s            
        }else if(s.length() == i){
            return s
        }
        
        return newString
    }
    
    def saveParamsgArduino (Lamp lampInstance){
        
        String dice = ""
        
        if(lampInstance.typeAnalogOrDigital.getType() == 1){
            //Analog
            String s = "1" 
            s += lampInstance.port
            dice += complete(s , 3)
        } else if(lampInstance.typeAnalogOrDigital.getType() == 0){
            //Digital
            dice += complete(lampInstance.port , 3)
        }        
        
        if(lampInstance.typeInOrOut.getType() == 0){
            //INPUT
            dice += "0"
        }else if(lampInstance.typeInOrOut.getType() == 1){
            //OUTPUT
            dice += "1"
        }   
       
        //pwm
        dice += "000"

        //Off
        dice += "0" 
        
        //metodo
        dice += "0"
        
        // Tipo de alteração
        dice += "1\r\n"       
        
        lampInstance.configArduino = dice
        
        sc.writeData(dice.getBytes())   
    }

}
