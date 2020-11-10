import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer.js';
import logger from 'redux-logger'
import thunk from '../middleware/thunk';


const configureStore = () =>  (
    createStore(
        rootReducer, // 1.sets up empty slices of state
        applyMiddleware(thunk, logger))// 2. thunk launches the ajax request
);

export default configureStore;
