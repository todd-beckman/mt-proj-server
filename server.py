import base64
from bottle import Bottle, get, request, response, run

app = Bottle()

sampledocs = {
    'a-glorious-doc': 'something glorious',
    'an-enigmatic-doc': 'something enigmatic',
    'a-fantastic-doc': 'something fantastic',
}

def decodeBase64Url(url):
    return base64.urlsafe_b64decode(url.replace("~", "="))

@app.hook('after_request')
def enable_corse():
    """
    For dev convenience only. Do not * in production.
    """
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'GET'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Accept, Content-Type, X-Requested-With, X-CSRF-Token'

@app.route('/doc/list', method=['GET'])
def getDocListHandler():
    """
    Get the list of documents
    """
    return sampledocs.keys()

@app.route('/doc/<docid>', method=['GET'])
def getDocHandler(docid):
    """
    Let KeyError raise for now. Error handling later.
    """
    print(docid)
    decodedDocId = decodeBase64Url(docid)
    return sampledocs[decodedDocId]

@app.route('/doc/<docid>', method=['POST'])
def postDocHandler(docid):
    """
    Naively insert
    """
    decodedDocId = decodeBase64Url(docid)
    postdata = request.body.read()
    print decodedDocId
    print postdata
    sampledocs[decodedDocId] = postdata

run(app, host='localhost', port=5080)
