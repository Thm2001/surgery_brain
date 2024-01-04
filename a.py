from waitress import serve
from c2matica_py_server.wsgi import application
from common.logger import Logger

if __name__ == '__main__':
    logger = Logger(__name__).get_logger()
    logger.info("Starting c2matica_py_server")
    serve(application, host='0.0.0.0', port=8002)
