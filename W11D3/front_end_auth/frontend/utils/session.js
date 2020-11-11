// create a user

export const postUser = user => (
    $.ajax({
        url: '/api/users',
        method: 'POST',
        data: { user },
        //data sent up
    })
);

// sign in a user

export const postSession = user => (
    $.ajax({
        url: '/api/session',
        method: 'POST',
        data: { user },
    })
);

//delete user

export const deleteSession = () => (
    $.ajax({
        url: '/api/session',
        method: 'DELETE',
    })
);