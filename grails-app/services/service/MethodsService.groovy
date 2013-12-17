package service

import arduinocontrol.Lamp
import arduinocontrol.Config
import gnu.io.CommPortIdentifier
import gnu.io.NoSuchPortException
import gnu.io.SerialPort
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream

class MethodsService {

    static OutputStream output
    static InputStream input
    static SerialPort port


    def initSerial() {
        
        Config c = Config.findByEnabled(true)
        
        if(c){         
            
            String portName = c.pin
            int dataRate = c.rate.getRate()
            
            try {
                CommPortIdentifier portId = null
                try {
                    portId = CommPortIdentifier.getPortIdentifier(portName)
                } catch (NoSuchPortException npe) {
                    npe.printStackTrace()
                }

                port = (SerialPort) portId.open("Título comunicação serial", dataRate)

                output = port.getOutputStream()
                input = port.getInputStream()

                port.setSerialPortParams(9600,
                    SerialPort.DATABITS_8,
                    SerialPort.STOPBITS_1,
                    SerialPort.PARITY_NONE)

            } catch (Exception e) {
                e.printStackTrace()
            }
        }
    }
    
    def resetSerial(){
        
        if(port){
            Object o = Object.findAll()        
            o.each{
                writeData(it.paramsArduino)
            }
        }
    }

    def closeSerial() { 
        if(port){ 
            try {
                output.close()
                input.close()
                port.removeEventListener()
                port.close()
            } catch (IOException e) {
                e.printStackTrace()
            }
        }
    }
    
    def writeData(String data){
        if(port){
            try {
                output.write(data.getBytes())         
            } catch (IOException e) {
                e.printStackTrace()
            }
        }    
    }
    
    def readData() {
        if(port){}
    }

    def saveParamsgArduino (Lamp lampInstance){
        
        String dice = ""
        
        if(lampInstance.typeAnalogOrDigital.getType() == 1){
            //Analog
            String s = "1" 
            s += lampInstance.pin
            dice += complete(s , 3)            
        } else if(lampInstance.typeAnalogOrDigital.getType() == 0){
            //Digital
            dice += complete(String.valueOf(lampInstance.pin) , 3)
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
        
        // Tipo de alteração
        dice += "1"
        
        //metodo
        dice += "00"
        
        //grupos
        dice += "00"
        
        //nada ainda
        dice += "00\r\n"       
        
        
        lampInstance.paramsArduino = dice         
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
    
}
