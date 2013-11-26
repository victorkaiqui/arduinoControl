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
        INPUT, 
        OUTPUT
    }
    enum TypeAnalogOrDigital{
        ANALOG,
        DIGITAL
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
