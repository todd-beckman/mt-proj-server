from bottle import Bottle, get, request, response, run

app = Bottle()

@app.hook('after_request')
def enable_corse():
    """
    For dev convenience only. Do not * in production.
    """
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'

@app.route('/', method=['GET'])
def index():
    return 'something fantastic'

run(app, host='localhost', port=5080)
