package arduinocontrol

import org.springframework.dao.DataIntegrityViolationException

class LampController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def methodsService
    
    private static final char ZERO = '0'
    private static final char ONE = '1'
    
    def status(Long id) {
        
        Lamp lampInstance = Lamp.get(id)
        StringBuilder s = new StringBuilder(lampInstance.configArduino);       
        
        if(lampInstance.status){
            lampInstance.status = false
            s.setCharAt(7,ZERO)                       
        }else{
            lampInstance.status = true
            s.setCharAt(7,ONE)
        }
             
        
        lampInstance.configArduino =  s.toString()
        lampInstance.configArduino += "\r\n"
        
        methodsService.writeData(lampInstance.configArduino.getBytes())          
       
        lampInstance.save(flush:true) 
        
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
        methodsService.saveParamsgArduino(lampInstance)
        
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
        methodsService.saveParamsgArduino(lampInstance)
        
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
