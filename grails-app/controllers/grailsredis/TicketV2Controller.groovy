package grailsredis

import org.springframework.dao.DataIntegrityViolationException

class TicketV2Controller {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [ticketV2InstanceList: TicketV2.list(params), ticketV2InstanceTotal: TicketV2.count()]
    }

    def create() {
        [ticketV2Instance: new TicketV2(params)]
    }

    def save() {
        def ticketV2Instance = new TicketV2(params)
        if (!ticketV2Instance.save(flush: true)) {
            render(view: "create", model: [ticketV2Instance: ticketV2Instance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), ticketV2Instance.id])
        redirect(action: "show", id: ticketV2Instance.id)
    }

    def show() {
        def ticketV2Instance = TicketV2.get(params.id)
        if (!ticketV2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), params.id])
            redirect(action: "list")
            return
        }

        [ticketV2Instance: ticketV2Instance]
    }

    def edit() {
        def ticketV2Instance = TicketV2.get(params.id)
        if (!ticketV2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), params.id])
            redirect(action: "list")
            return
        }

        [ticketV2Instance: ticketV2Instance]
    }

    def update() {
        def ticketV2Instance = TicketV2.get(params.id)
        if (!ticketV2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (ticketV2Instance.version > version) {
                ticketV2Instance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'ticketV2.label', default: 'TicketV2')] as Object[],
                        "Another user has updated this TicketV2 while you were editing")
                render(view: "edit", model: [ticketV2Instance: ticketV2Instance])
                return
            }
        }

        ticketV2Instance.properties = params

        if (!ticketV2Instance.save(flush: true)) {
            render(view: "edit", model: [ticketV2Instance: ticketV2Instance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), ticketV2Instance.id])
        redirect(action: "show", id: ticketV2Instance.id)
    }

    def delete() {
        def ticketV2Instance = TicketV2.get(params.id)
        if (!ticketV2Instance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), params.id])
            redirect(action: "list")
            return
        }

        try {
            ticketV2Instance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ticketV2.label', default: 'TicketV2'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
