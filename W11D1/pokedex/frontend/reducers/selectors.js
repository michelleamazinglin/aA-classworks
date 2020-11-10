
export const selectAllPokemon = state => { 
    Object.values(state.entities.pokemon);
} // we take in state as an object
// we get the values from the state through Object.values
// which are nested in the entities
// and the pokemon objects are accessed through state.entities.pokemon
