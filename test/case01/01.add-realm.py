from keycloak_api import Connector

c = Connector('xkeycloak', '8080', 'admin', 'pass')
c.get_token()
