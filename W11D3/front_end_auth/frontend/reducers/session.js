import {
    RECIEVE_CURRENT_USER,
    LOGOUT_CURRENT_USER,
} from '../actions/session';

//default state
//return this if we dont have a currentUser
const _nullSession = {
    currentUser: null,
};

// build reducer, every reducer takes in two arguments
export default (state = _nullSession, action) => {
    Object.freeze(state);
    //freze state so we cant mutate the state
    switch (action.type) {
        case RECIEVE_CURRENT_USER:
            return Object.assign ({}, { currentUser: action.user });
        case LOGOUT_CURRENT_USER:
            return _nullSession;
        default:
            return state;
    }
};