package arduinocontrol

import org.springframework.dao.DataIntegrityViolationException
import serial.SerialCommunication

class LampController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    SerialCommunication sc = new SerialCommunication()

    def status(Long id) {
        
        Lamp lampInstance = Lamp.get(id)
        
        String dice = ""
        
        if(lampInstance.typeAnalogOrDigital.getType() == 0){
            String s = "1" 
            s += lampInstance.port
            dice += complete(s , 3)
        } else if(lampInstance.typeAnalogOrDigital.getType() == 1){
            dice += complete(lampInstance.port , 3)
        }        
        
        if(lampInstance.typeInOrOut.getType() == 0){
            dice += "0"
        }          else if(lampInstance.typeInOrOut.getType() == 1){
            dice += "1"
        }   
       
        dice += "000"
        
        if(lampInstance.status){
            lampInstance.status = false
            dice += "0"
            lampInstance.save(flush:true)
            print "Desligado"
        }else{
            lampInstance.status = true
            dice += "1"               
            lampInstance.save(flush:true)
            print "ligado"
        }
         
        dice += "0\n";  
       
        sc.writeData(dice.getBytes())          
                   
        redirect(action: "index")
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
    
    def initSerial() {
        Config c = Config.findByEnabled(true)
        sc.initSerial(c.port , c.rate.getRate())
        redirect(action: "index")
    }

    def close() {       
        sc.close()
        redirect(action: "index")
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [lampInstanceList: Lamp.list(params), lampInstanceTotal: Lamp.count()]
    }

    def create() {
        [lampInstance: new Lamp(params)]
    }

    def save() {
        def lampInstance = new Lamp(params)
        if (!lampInstance.save(flush: true)) {
            render(view: "create", model: [lampInstance: lampInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'lamp.label', default: 'Lamp'), lampInstance.id])
        redirect(action: "show", id: lampInstance.id)
    }

    def show(Long id) {
        def lampInstance = Lamp.get(id)
        if (!lampInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "list")
            return
        }

        [lampInstance: lampInstance]
    }

    def edit(Long id) {
        def lampInstance = Lamp.get(id)
        if (!lampInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "list")
            return
        }

        [lampInstance: lampInstance]
    }

    def update(Long id, Long version) {
        def lampInstance = Lamp.get(id)
        if (!lampInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (lampInstance.version > version) {
                lampInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'lamp.label', default: 'Lamp')] as Object[],
                          "Another user has updated this Lamp while you were editing")
                render(view: "edit", model: [lampInstance: lampInstance])
                return
            }
        }

        lampInstance.properties = params

        if (!lampInstance.save(flush: true)) {
            render(view: "edit", model: [lampInstance: lampInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'lamp.label', default: 'Lamp'), lampInstance.id])
        redirect(action: "show", id: lampInstance.id)
    }

    def delete(Long id) {
        def lampInstance = Lamp.get(id)
        if (!lampInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "list")
            return
        }

        try {
            lampInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "show", id: id)
        }
    }
}
