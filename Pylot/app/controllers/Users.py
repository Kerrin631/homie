from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Message')

    def index(self):
        return self.load_view('index.html')

    def process_login(self):
        user_info = {
        'clientID': request.form['clientID'],
        'accessToken': request.form['accessToken'],
        'email': request.form['email'],
        'first_name': request.form['first_name'],
        'last_name': request.form['last_name']
        }
        status = self.models['User'].process_login(user_info)
        session['id'] = status['user']['id']
        return redirect('/process_home')

    def success(self):
        return self.load_view('success.html')

    def home(self):
        return self.load_view('home.html')

    def profile(self):
        return self.load_view('profile.html')

    def friends_page(self):
        return redirect('/home')

    def communicate(self):
        return self.load_view('messages.html')

    def messages_page(self):
        return redirect('/communicate')

    def register_page(self):
        return self.load_view('register.html')


    def logout(self):
        session.clear()
        return redirect('/')
