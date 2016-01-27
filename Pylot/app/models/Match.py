from system.core.model import Model
import random

class Match(Model):
    def __init__(self):
        super(Match, self).__init__()

    def add_match(self,match_info):
        query = "INSERT INTO friends (user_id,friend_id,is_match,created_at) VALUES (%s,%s,%s,now())"
        data = [match_info['user_id'],int(match_info['friend_id']),match_info['is_match']]
        self.db.query_db(query,data)
        if match_info['is_match'] == "YES":
            if self.find_is_matched(match_info['friend_id'],match_info['user_id']) != []:
                print "match"


    def get_potential_user(self,user_id):
        query = "SELECT * from users WHERE users.id NOT IN (SELECT friend_id from friends \
        WHERE friends.user_id = %s) AND users.id NOT IN (%s)"
        data = [user_id,user_id]
        print data
        potential_users = self.db.query_db(query,data)
        random_selected = random.randint(0,len(potential_users)-1)
        return potential_users[random_selected]

    def get_user_by_id(self,user_id):
        user_query = "SELECT * FROM users WHERE id = %s LIMIT 1"
        user_data = [user_id]
        return self.db.query_db(user_query, user_data)[0]

    def find_is_matched(self,friend_id,user_id):
        query = "SELECT * from friends WHERE friend_id = %s AND is_match = 'YES' AND user_id = %s"
        data = [friend_id,user_id]
        return self.db.query_db(query,data)

#After the add match
#Take that friend id
#Go through friends table and see if that friend matched the user id
