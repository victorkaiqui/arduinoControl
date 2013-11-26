package arduinocontrol

class Config {
    
    Date dateCreated
    Date lastUpdated
    
    String port
    DataRate rate
    boolean enabled
    
    enum DataRate{        
        BAUD300(300),
        BAUD1200(1200),
        BAUD2400(2400),
        BAUD4800(4800),
        BAUD9600(9600),
        BAUD14400(14400)
        
        private int rate        
        
        DataRate(int rate){
            this.rate = rate   
        } 
        
        public int getRate(){
            return rate
        }
    }

    static constraints = {
        port(blank: false)
        rate(blank: false)
    }
}
