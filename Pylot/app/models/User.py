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
        print "here1"
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
            query = "SELECT * FROM users Where email = %s"
            data = [user_info['email']]
            user = self.db.query_db(query,data)
            return {'status' : True, 'user' : user[0]}
            if len(user) > 0:
                if self.bcrypt.check_password_hash(user[0]['password'], user_info['password']):
                    return {'status' : True, 'user' : user[0]}
                else:
                    print
                    errors.append('Password or Email is Invalid')
                    return {'status' : False, 'errors': errors}
            else:
                errors.append('Email was not found')
                return {'status' : False, 'errors': errors}

    def get_users(self):
        return self.db.query_db("SELECT * from users")

    def add_user_info(self, info):
        query = "UPDATE users SET profile_info = (%s), age = (%s), gender = (%s), latitude = (%s), longitude = (%s) WHERE id = (%s)"
        data = [info['content'], info['age'], info['gender'], info['latitude'], info['longitude'], info['user']]
        return self.db.query_db(query,data)

    def get_aboutMe_by_id(self, user_id):
        user_id_query = "SELECT * FROM users WHERE id = %s LIMIT 1"
        id_data = [user_id]
        return self.db.query_db(user_id_query, id_data)

    def get_location_by_id(self, id):
        user_query = "SELECT * FROM users WHERE id = %s LIMIT 1"
        user_data = [id]
        return self.db.query_db(user_query, user_data)[0]




