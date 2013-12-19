package arduinocontrol

class Cluster {
    
    Date dateCreated
    Date lastUpdated
     
    String nameCluster
    String descriptionCluster
    Integer valuePwm
    Boolean isPwm = false
    
    static hasMany = [objects: Object]   
        
    static constraints = {
        nameCluster(blank: false)
        descriptionCluster(blank: true)
        valuePwm(blank: true , nullable: true)
    }    
}
