import {
  signup, 
  signin,
  signout
} from '../util/session_api_util'

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_SESSION_ERROR = 'RECEIVE_SESSION_ERROR';

const receiveCurrentUser = currentUser => ({
  type: RECEIVE_CURRENT_USER,
  user: currentUser
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
})

const receiveErrors = errors => ({
    typr: RECEIVE_SESSION_ERROR,
    errors
})

//thunk
export const signinUser = user => dispatch => signinUser(user)
  .then(user => dispatch(signin(user)));

export const signupUser = user => dispatch => signupUser(user)
  .then(user => dispatch(signup(user)));

export const signoutUser = () => dispatch => signoutUser()
    .then(() => dispatch(signout()));