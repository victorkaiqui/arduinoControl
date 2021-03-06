package arduinocontrol

import org.springframework.dao.DataIntegrityViolationException

class LampController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def methodsService
    
    private static final char ZERO = '0'
    private static final char ONE = '1'
    
    def status(Long id) {
        
        def lampInstance = Lamp.get(id)
        StringBuilder s = new StringBuilder(lampInstance.paramsArduino);       
        
        if(lampInstance.status){
            lampInstance.status = false
            s.setCharAt(7,ZERO)                       
        }else{
            lampInstance.status = true
            s.setCharAt(7,ONE)
        }             
        
        lampInstance.paramsArduino =  s.toString()
        lampInstance.paramsArduino += "\r\n"
        
        methodsService.writeData(lampInstance.paramsArduino)          
       
        lampInstance.save(flush:true) 
        redirect(uri: "/lamp/list")
    } 
    
    def statusIndex(Long id) {
        
        def lampInstance = Lamp.get(id)
        StringBuilder s = new StringBuilder(lampInstance.paramsArduino);       
        
        if(lampInstance.status){
            lampInstance.status = false
            s.setCharAt(7,ZERO)                       
        }else{
            lampInstance.status = true
            s.setCharAt(7,ONE)
        }
                     
        lampInstance.paramsArduino =  s.toString()
        lampInstance.paramsArduino += "\r\n"
        
        methodsService.writeData(lampInstance.paramsArduino)          
       
        lampInstance.save(flush:true) 
        render (template: '/index/fragmentStatus', model: [o: lampInstance])
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
        methodsService.writeData(lampInstance.paramsArduino)
        
        if(lampInstance.cluster.isPwm){
            lampInstance.isPwm = true
        }
        
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
        methodsService.writeData(lampInstance.paramsArduino)
        
        if (!lampInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'lamp.label', default: 'Lamp'), id])
            redirect(action: "list")
            return
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
