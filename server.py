from bottle import Bottle, get, request, response, run

app = Bottle()

sampledocs = {
    '1': 'something glorious',
    '2': 'something enigmatic',
    'a': 'something fantastic',
}


@app.hook('after_request')
def enable_corse():
    """
    For dev convenience only. Do not * in production.
    """
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'

@app.route('/doc/<docid>', method=['GET'])
def getDocHandler(docid):
    """
    Let KeyError raise for now. Error handling later.
    """
    return sampledocs[docid]

@app.route('/doc/<docid>', method=['POST'])
def postDocHandler(docid):
    """
    Naively insert
    """
    postdata = request.body.read()
    print docid
    print postdata
    sampledocs[docid] = postdata

run(app, host='localhost', port=5080)
