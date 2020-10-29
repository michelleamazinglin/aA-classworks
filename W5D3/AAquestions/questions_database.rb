require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton #only going to have one instance
    #the sinleton already have a instance method build in
    #return instence object
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end