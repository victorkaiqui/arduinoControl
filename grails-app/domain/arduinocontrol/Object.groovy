package arduinocontrol

class Object {

    Date dateCreated
    Date lastUpdated
     
    String name
    String description
    String paramsArduino
    Integer pin
    Integer valuePwm
    Boolean isPwm = false
    Cluster cluster
    TypeInOrOut typeInOrOut
    TypeAnalogOrDigital typeAnalogOrDigital 
    
    
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
        description(blank: true , nullable: true)
        paramsArduino(blank: false)
        pin(blank: false)
        valuePwm(blank: true , nullable: true)
        isPwm()
        typeInOrOut(blank: false)
        typeAnalogOrDigital(blank: false)
    }
}
