package arduinocontrol

class Group {
    
    
    Date dateCreated
    Date lastUpdated
     
    String nameGroup
    String descriptionGroup
    static hasMany = [objects: Object]   
     
    static constraints = {
    }
    static mapping = {
        table "tb_group"      
    }
}
