import { RECEIVE_ALL_POKEMON } from '../actions/pokemon_actions';

    const pokemonReducer = (oldState = {}, action) => {
        Object.freeze(oldState)

        switch (action.type) {
            case RECEIVE_ALL_POKEMON:
            
                return Object.assign({}, oldState, action.pokemon); // action.pokemon its an pokemon of all the pokemon, so its put into a new object to not mutate the oldstate
                // action.pokemon.forEach (poke)  
                // return newState;
            
        default:
            return oldState
        }
    }

export default pokemonReducer;