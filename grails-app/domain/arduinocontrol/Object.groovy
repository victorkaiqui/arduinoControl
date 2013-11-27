package arduinocontrol

class Object {

    Date dateCreated
    Date lastUpdated
     
    String name
    String description
    String port
    TypeInOrOut typeInOrOut
    TypeAnalogOrDigital typeAnalogOrDigital
    Boolean isPwn = false
    
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
        ANALOG(0),
        DIGITAL(1)
        
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
