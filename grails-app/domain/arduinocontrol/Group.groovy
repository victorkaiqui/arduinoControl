package arduinocontrol

class Group {
    static hasMany = [object: Object]        
    
    Date dateCreated
    Date lastUpdated
     
    String nameGroup
    String descriptionGroup
    
    static constraints = {
    }
}
