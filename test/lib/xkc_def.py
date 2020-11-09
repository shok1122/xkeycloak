import json

class Token:

    def __init__(self):
        self.access_token = None
        self.expires_in = None
        self.refresh_expires_in = None
        self.refresh_token = None
        self.token_type = None
        self.not_before_policy = None
        self.session_state = None
        self.scope = None

    def load(self, json_str):
        tmp = json.loads(json_str)
        self.access_token = tmp['access_token']
        self.expires_in = tmp['expires_in']
        self.refresh_expires_in = tmp['refresh_expires_in']
        self.refresh_token = tmp['refresh_token']
        self.token_type = tmp['token_type']
        self.not_before_policy = tmp['not-before-policy']
        self.session_state = tmp['session_state']
        self.scope = tmp['scope'].split()

    def __repr__(self):
        return \
            f"access_token: {self.access_token}\n" + \
            f"expires_in: {self.expires_in}\n" + \
            f"refresh_expires_in: {self.refresh_expires_in}\n" + \
            f"refresh_token: {self.refresh_token}\n" + \
            f"token_type: {self.token_type}\n" + \
            f"not-before-policy: {self.not_before_policy}\n" + \
            f"session_state: {self.session_state}\n" + \
            f"scope: {self.scope}"
