from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Message')

    def index(self):
        return self.load_view('index.html')

    def register(self):
        user_info = {
        'first_name' : request.form['first_name'],
        'last_name' : request.form['last_name'],
        'email' : request.form['email'],
        'password' : request.form['password'],
        'confirm_password' : request.form['confirm_password']
        }

        create_status = self.models['User'].register_user(user_info)

        if create_status['status'] == True:
            session['id'] = create_status['user']['id']
            return redirect('/success')
        else:
            for message in create_status['errors']:
                flash(message, 'regis_errors')
            return redirect('/')

    def login(self):
        user_info = {
        'email' : request.form['email'],
        'password' : request.form['password']
        }

        status = self.models['User'].login_user(user_info)

        if status['status'] == False:
            for message in status['errors']:
                flash(message, 'Login_errors')
            return redirect('/')
        else:
            session['id'] = status['user']['id']
            print session['id']
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
        pass


