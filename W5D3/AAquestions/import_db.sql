PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

--------------------------

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Michelle', 'Lin'),
    ('Lauren', 'Thompson');

--------------------------------

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    question_body TEXT NOT NULL,
    associated_author_id INTEGER NOT NULL,

    FOREIGN KEY (associated_author_id) REFERENCES users(id)
);

INSERT INTO
    questions (title, question_body, associated_author_id)
VALUES
    ('Michelle''s title', 'a question', (SELECT id FROM users WHERE fname = 'Michelle')),
    ('Lauren''s title', 'another question',(SELECT id FROM users WHERE fname = 'Lauren'));

-------------------------------------

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    follower_user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (follower_user_id) REFERENCES users(id) -- connect questions follows id to users table id
);

INSERT INTO
    question_follows (question_id, follower_user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'Michelle''s title'), (SELECT id FROM users WHERE fname = 'Michelle')),
    ((SELECT id FROM questions WHERE title = 'Lauren''s title'), (SELECT id FROM users WHERE fname = 'Lauren'));

--------------------------------

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    reply_body TEXT NOT NULL,
    parent_reply_id INTEGER,
    
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

INSERT INTO
    replies (question_id, author_id, reply_body, parent_reply_id)
VALUES
    (
        (SELECT id FROM questions WHERE title = 'Lauren''s title'),
        (SELECT id FROM users WHERE fname = 'Michelle'),
         'replies #1', NULL
    );

INSERT INTO
    replies (question_id, author_id, reply_body, parent_reply_id)
VALUES
    (
        (SELECT id FROM questions WHERE title = 'Lauren''s title'),
        (SELECT id FROM users WHERE fname = 'Lauren'),
        'child replies #1', 
        (SELECT id FROM replies WHERE reply_body = 'replies #1')
    );
    
-------------------------------------------

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    like_user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (like_user_id) REFERENCES users(id)
);

INSERT INTO
    question_likes(question_id, like_user_id)
VALUES
    (
        (SELECT id FROM questions WHERE title = 'Michelle''s title'),
        (SELECT id FROM users WHERE fname = 'Lauren')
    ),
    (
        (SELECT id FROM questions WHERE title = 'Lauren''s title'),
        (SELECT id FROM users WHERE fname = 'Michelle')
    );
    
