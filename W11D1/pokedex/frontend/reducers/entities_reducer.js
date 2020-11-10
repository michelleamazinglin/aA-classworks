import {combineReducers } from 'redux';
import pokemon from './pokemon_reducer'; //use pokemon instead of pokemon_reducer because we only have one pokemon_reducer in the file

const entitiesReducer = combineReducers({
    pokemon
})

export default entitiesReducer;