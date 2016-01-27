from system.core.model import Model

import re
class Message(Model):
	def __init__(self):
		super(Message, self).__init__()

	def add_message(self, message):
		query = "INSERT INTO messages (user_id, content, created_at) VALUES (%s, %s, NOW())"
		data =  [message['user_id'], message['message']]
		return self.db.query_db(query, data)