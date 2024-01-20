import logging
from logging.handlers import RotatingFileHandler


class Logger:
    def __init__(self, name, log_file="./logs/log.txt", level=logging.INFO):
        self.logger = logging.getLogger(name)
        self.logger.setLevel(level)

        if not self.logger.handlers:
            console_handler = logging.StreamHandler()
            console_handler.setLevel(level)

            file_handler = RotatingFileHandler(log_file, maxBytes=1024 * 1024 * 5, backupCount=3)
            file_handler.setLevel(level)

            formatter = logging.Formatter('%(asctime)s - %(name)s - (%(filename)s:%(lineno)d) - %(message)s')
            console_handler.setFormatter(formatter)
            file_handler.setFormatter(formatter)

            self.logger.addHandler(console_handler)
            self.logger.addHandler(file_handler)

    def get_logger(self):
        return self.logger
