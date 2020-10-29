require_relative 'users.rb'

class Replies
    attr_accessor :question_id, :author_id, :reply_body, :parent_reply_id

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @author_id = options['author_id']
        @reply_body = options['reply_body']
        @parent_reply_id = options['parent_reply_id']
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Replies.new(datum) }
    end

    def self.find_by_user_id(user_id)
        author = Users.find_by_name(fname,lname)
        raise "#{user_id} not found in DB" unless author

        replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        
        replies.map { |reply| Replies.new(reply) }
    end
    
    # def find_by_question_id(question_id)
    # end
end

# Reply#author
# Reply#question
# Reply#parent_reply
# Reply#child_replies
