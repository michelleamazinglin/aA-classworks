require_relative 'users.rb'

class Questions
    attr_accessor :title, :question_body, :associated_author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @question_body = options['question_body']
        @associated_author_id = options['associated_author_id']
    end

    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Questions.new(datum) }
    end

    def self.find_by_id(id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = ?
        SQL
        
        return nil unless questions.length > 0

        Questions.new(questions.first) 
    end

    def self.find_by_author_id(associated_author_id)
        
        questions = QuestionsDatabase.instance.execute(<<-SQL, associated_author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                associated_author_id = ?
        SQL
        
        questions.map { |question| Questions.new(question) }
    end

    def author
        #associated_author_id in users class
        # SELECT fname AND lname from users where id = associated_author_id
        # we get the name out if @associated_author_id == id in users table
        #initialize 
        Users.find_by_id(@associated_author_id)
        
    end

    def replies
        Replies.find_by_question_id(@id)
    end

    # Question#author
    # Question#replies (use Reply::find_by_question_id)

end
