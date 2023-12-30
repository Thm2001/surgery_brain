from waitress import serve
from c2matica_py_server.wsgi import application

if __name__ == '__main__':
    serve(application, host='0.0.0.0', port=8002)
