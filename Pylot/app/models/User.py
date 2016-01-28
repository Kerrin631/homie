from system.core.model import Model

import re
class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def get_users(self):
        return self.db.query_db("SELECT * from users")

    def is_user_not_in_db(self,clientID):
        query="SELECT clientID from users WHERE clientID = %s"
        data =[clientID]
        if self.db.query_db(query,data) == []:
            return True
        else:
            return False

    def process_login(self,user_info):
        if self.is_user_not_in_db(user_info['clientID']):
            query = "INSERT INTO users (first_name,last_name,email,clientID,accessToken) \
            VALUES (%s,%s,%s,%s,%s)"
            data = [user_info['first_name'],user_info['last_name'],user_info['email'], \
            user_info['clientID'],user_info['accessToken']]
            self.db.query_db(query,data)
            get_user = "Select * From users Order By id DESC LIMIT 1"
            user = self.db.query_db(get_user)
            return {'status' : True , 'user' : user[0]}
        else:
            print "over there"
            query = "SELECT * FROM users Where email = %s"
            data = [user_info['email']]
            user = self.db.query_db(query,data)
            return {'status' : True, 'user' : user[0]}