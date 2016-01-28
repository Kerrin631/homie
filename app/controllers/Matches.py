from system.core.controller import *
from geopy.distance import vincenty

class Matches(Controller):
    def __init__(self, action):
        super(Matches, self).__init__(action)
        self.load_model('Match')
        self.load_model('User')

    def process_home(self):
        current_user = self.models['Match'].get_potential_user(session['id'])
        print current_user['id']
        destination = '/home/' + str(current_user['id'])
        return redirect (destination)


# begin like/dislike buttons---------->>>

    def home(self,friend_id):
        #select statement that picks a random id
        #if that match value == null && location is within range
        #then bring up the new picture
        current_user = self.models['Match'].get_user_by_id(friend_id)

        user_info = self.models['User'].get_location_by_id(session['id'])
        user_location = str(user_info['latitude']) + ',' + str(user_info['longitude'])
        friend_location = str(current_user['latitude']) + ',' + str(current_user['longitude'])

        picture = "https://graph.facebook.com/v2.5/" + current_user['clientID'] + "/picture?width=350&height=350"
        distance = (vincenty(user_location, friend_location).miles)
        return self.load_view('home.html', current_user=current_user, distance = distance, picture=picture)

    def process_match(self,friend_id):
        match_info = {
            "user_id": session['id'],
            "friend_id": friend_id,
            "is_match": request.form['is_match']
        }
        self.models['Match'].add_match(match_info)

        return redirect ('/process_home')


# end like/dislike buttons ----------->>>

# if other person says yes = match
# if no then = NULL
