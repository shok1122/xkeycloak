import requests

from xkc_def import Token

class Connector:

    def __init__(self, host, port, user, password):
        self.host = host
        self.port = port
        self.user = user
        self.password = password

    def get_token(self):
        url = self.__get_url('master', 'protocol/openid-connect/token')
        payload = {
            'client_id':"admin-cli",
            'username':self.user,
            'password':self.password,
            'grant_type':'password',
        }
        resp = requests.post(url, data=payload)

        self.token = Token()
        self.token.load(resp.text)

    def __get_url(self, realm, path):
        return f'http://{self.host}:{self.port}/auth/realms/{realm}/{path}'
