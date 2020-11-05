import { combineReducers } from 'redux';
import todosReducer from './todos_reducer'

const rootReducer = combineReducers({
    todos: todosReducer
});


export default rootReducer

// rootReducer = combineReducers({
//     potato: potatoReducer, 
//     tomato: tomatoReducer})