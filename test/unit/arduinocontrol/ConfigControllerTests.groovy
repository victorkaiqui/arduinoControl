package arduinocontrol



import org.junit.*
import grails.test.mixin.*

@TestFor(ConfigController)
@Mock(Config)
class ConfigControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/config/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.configInstanceList.size() == 0
        assert model.configInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.configInstance != null
    }

    void testSave() {
        controller.save()

        assert model.configInstance != null
        assert view == '/config/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/config/show/1'
        assert controller.flash.message != null
        assert Config.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/config/list'

        populateValidParams(params)
        def config = new Config(params)

        assert config.save() != null

        params.id = config.id

        def model = controller.show()

        assert model.configInstance == config
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/config/list'

        populateValidParams(params)
        def config = new Config(params)

        assert config.save() != null

        params.id = config.id

        def model = controller.edit()

        assert model.configInstance == config
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/config/list'

        response.reset()

        populateValidParams(params)
        def config = new Config(params)

        assert config.save() != null

        // test invalid parameters in update
        params.id = config.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/config/edit"
        assert model.configInstance != null

        config.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/config/show/$config.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        config.clearErrors()

        populateValidParams(params)
        params.id = config.id
        params.version = -1
        controller.update()

        assert view == "/config/edit"
        assert model.configInstance != null
        assert model.configInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/config/list'

        response.reset()

        populateValidParams(params)
        def config = new Config(params)

        assert config.save() != null
        assert Config.count() == 1

        params.id = config.id

        controller.delete()

        assert Config.count() == 0
        assert Config.get(config.id) == null
        assert response.redirectedUrl == '/config/list'
    }
}
