from system.core.controller import *

class Messages(Controller):
    def __init__(self, action):
        super(Messages, self).__init__(action)
        self.load_model('User')
        self.load_model('Message')


    def post_message(self):
    	print 'HELLOHELLO'
    	print request.form['content']
    	print session['id']
    	print session['name']
    	message_cont = {
    		'message' : request.form['content'],
    		"user_id" : session['id']
    	}
    	self.models['Message'].add_message(message_cont)
    	return redirect('/communicate')