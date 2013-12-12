package arduinocontrol

class Object {

    Date dateCreated
    Date lastUpdated
     
    String name
    String description
    Integer pin
    String paramsArduino
    TypeInOrOut typeInOrOut
    TypeAnalogOrDigital typeAnalogOrDigital
    Boolean isPwm = false
    Integer valuePwm
    Group group
    
    enum TypeInOrOut{        
        INPUT(0), 
        OUTPUT(1)
        
        private int type
        
        TypeInOrOut(int type){
            this.type = type
        }
        
        public int getType(){
            return type
        }
    }
    
    enum TypeAnalogOrDigital{
        ANALOG(1),
        DIGITAL(0)
        
        private int type
        
        TypeAnalogOrDigital(int type){
            this.type = type
        }
        
        public int getType(){
            return type
        }
    }
    
    static constraints = {
        name(blank: false)
        description()
        pin()
        paramsArduino()
        typeInOrOut()
        typeAnalogOrDigital()
        isPwm()
        valuePwm()
    }
}
