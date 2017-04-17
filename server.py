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

@app.route('/get', method=['GET'])
def getIndex():
    return 'something fantastic'

@app.route('/post', method=['POST'])
def postIndex():
    return 'something enigmatic'

run(app, host='localhost', port=5080)
