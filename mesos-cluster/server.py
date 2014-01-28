import sys
import socket
import logging
LOG = logging.getLogger(__name__)

fmt = '[%(asctime)s] %(levelname)s - %(message)s'
logging.basicConfig(format=fmt, level=logging.DEBUG)

s = socket.socket()
bind_addr = ('0.0.0.0', int(sys.argv[1]))
s.bind(bind_addr)

LOG.info('Listening to connections on %s:%i', *bind_addr)
s.listen(10)

while True:
    cl, addr = s.accept()
    LOG.info('Connection accepted: %s:%i', *addr)
    data = cl.recv(1024)
    cl.send('echo [{}]: {}'.format(socket.gethostbyname(socket.gethostname()), data))
    LOG.info('Connection closed: %s:%i', *addr)
    cl.close()
