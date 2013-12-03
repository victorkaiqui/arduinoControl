package arduinocontrol

import org.springframework.dao.DataIntegrityViolationException


class ConfigController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def methodsService

    def initSerial() {
        methodsService.initSerial()
        redirect(action: "index")
    }

    def closeSerial() {       
        methodsService.closeSerial()
        redirect(action: "index")
    }
    
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [configInstanceList: Config.list(params), configInstanceTotal: Config.count()]
    }

    def create() {
        [configInstance: new Config(params)]
    }

    def save() {
        def configInstance = new Config(params)
        if (!configInstance.save(flush: true)) {
            render(view: "create", model: [configInstance: configInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'config.label', default: 'Config'), configInstance.id])
        redirect(action: "show", id: configInstance.id)
    }

    def show(Long id) {
        def configInstance = Config.get(id)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label', default: 'Config'), id])
            redirect(action: "list")
            return
        }

        [configInstance: configInstance]
    }

    def edit(Long id) {
        def configInstance = Config.get(id)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label', default: 'Config'), id])
            redirect(action: "list")
            return
        }

        [configInstance: configInstance]
    }

    def update(Long id, Long version) {
        def configInstance = Config.get(id)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label', default: 'Config'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (configInstance.version > version) {
                configInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'config.label', default: 'Config')] as Object[],
                          "Another user has updated this Config while you were editing")
                render(view: "edit", model: [configInstance: configInstance])
                return
            }
        }

        configInstance.properties = params

        if (!configInstance.save(flush: true)) {
            render(view: "edit", model: [configInstance: configInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'config.label', default: 'Config'), configInstance.id])
        redirect(action: "show", id: configInstance.id)
    }

    def delete(Long id) {
        def configInstance = Config.get(id)
        if (!configInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'config.label', default: 'Config'), id])
            redirect(action: "list")
            return
        }

        try {
            configInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'config.label', default: 'Config'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'config.label', default: 'Config'), id])
            redirect(action: "show", id: id)
        }
    }
}
