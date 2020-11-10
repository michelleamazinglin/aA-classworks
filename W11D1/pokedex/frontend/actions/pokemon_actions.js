export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';

export const receiveAllPokemon = pokemon => ({ // another for the received pokemon data.
    type: RECEIVE_ALL_POKEMON, // this is the action object
    pokemon // 2nd key = received pokemon data
});

// a thunk will intercept the action below to update the state and render the successful content
export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon() // GET request to register the index to see all the pokemon on the page
      .then(pokemon => dispatch(receiveAllPokemon(pokemon))) 
  );