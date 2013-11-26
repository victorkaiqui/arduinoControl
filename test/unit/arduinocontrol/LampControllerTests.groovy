package arduinocontrol



import org.junit.*
import grails.test.mixin.*

@TestFor(LampController)
@Mock(Lamp)
class LampControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/lamp/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.lampInstanceList.size() == 0
        assert model.lampInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.lampInstance != null
    }

    void testSave() {
        controller.save()

        assert model.lampInstance != null
        assert view == '/lamp/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/lamp/show/1'
        assert controller.flash.message != null
        assert Lamp.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/lamp/list'

        populateValidParams(params)
        def lamp = new Lamp(params)

        assert lamp.save() != null

        params.id = lamp.id

        def model = controller.show()

        assert model.lampInstance == lamp
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/lamp/list'

        populateValidParams(params)
        def lamp = new Lamp(params)

        assert lamp.save() != null

        params.id = lamp.id

        def model = controller.edit()

        assert model.lampInstance == lamp
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/lamp/list'

        response.reset()

        populateValidParams(params)
        def lamp = new Lamp(params)

        assert lamp.save() != null

        // test invalid parameters in update
        params.id = lamp.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/lamp/edit"
        assert model.lampInstance != null

        lamp.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/lamp/show/$lamp.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        lamp.clearErrors()

        populateValidParams(params)
        params.id = lamp.id
        params.version = -1
        controller.update()

        assert view == "/lamp/edit"
        assert model.lampInstance != null
        assert model.lampInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/lamp/list'

        response.reset()

        populateValidParams(params)
        def lamp = new Lamp(params)

        assert lamp.save() != null
        assert Lamp.count() == 1

        params.id = lamp.id

        controller.delete()

        assert Lamp.count() == 0
        assert Lamp.get(lamp.id) == null
        assert response.redirectedUrl == '/lamp/list'
    }
}
