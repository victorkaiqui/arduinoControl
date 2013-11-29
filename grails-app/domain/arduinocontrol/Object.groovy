package arduinocontrol

class Object {

    Date dateCreated
    Date lastUpdated
     
    String name
    String description
    String port
    String configArduino
    TypeInOrOut typeInOrOut
    TypeAnalogOrDigital typeAnalogOrDigital
    Boolean isPwn = false
    
    enum TypeInOrOut{        
        INPUT(1), 
        OUTPUT(0)
        
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
        port(blank: false, unique: true)
        typeInOrOut(blank: false)
        typeAnalogOrDigital(blank: false)
        isPwn(blank: false)
    }
}
