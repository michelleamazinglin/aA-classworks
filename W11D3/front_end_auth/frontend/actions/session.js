//import actions from util
import {
    postUser,
    deleteSession,
    postSession
} from '../utils/session';


//building the const
//make sure they re the same no matter whwere we use it
export const RECIEVE_CURRENT_USER = "RECIEVE_CURRENT_USER";
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER";

//return plain JS object with a type and a payload
const recieveCurrentUser = user => ({
    type: RECIEVE_CURRENT_USER,
    user, 
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
})

//thunk action
// a thunk will intercept the action below to update the state and render the successful content
//export but why????

//sign up
export const createNewUser = formUser => dispatch => postUser(formUser)
    .then(user => dispatch(recieveCurrentUser(user)));
//take in user object from a form and recieve dispath from thunk middleware and call postUser method from above
//postUser is a AJAX request
//if we successful recieve the request, update the state...


//log in
export const logIn = formUser => dispatch => postSession(formUser)
    .then(user => dispatch(recieveCurrentUser(user)));

//logout
export const logOut = () => dispatch => deleteSession()
    .then(() => dispatch(logoutCurrentUser()));