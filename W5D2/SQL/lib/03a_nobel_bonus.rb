# == Schema Information
#
# Table name: nobels
#
#  yr          :integer
#  subject     :string
#  winner      :string

require_relative './sqlzoo.rb'

def physics_no_chemistry
  # In which years was the Physics prize awarded, but no Chemistry prize?
  execute(<<-SQL)
  SELECT
    yr
  FROM
    nobels
  WHERE
    subject NOT IN ('Chemistry') AND subject = 'Physics';
  SQL
end

#subquery

# SELECT column_names
# FROM table_name
# WHERE column_name IS NULL;

# SELECT * FROM Customers
# WHERE Country NOT IN ('Germany', 'France', 'UK');