import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon } from './actions/pokemon_actions.js'
import { fetchAllPokemon } from './util/api_util.js'
import  configureStore from './store/store.js'

document.addEventListener('DOMContentLoaded', () => {
  // debugger
  const store = configureStore();

  const rootEl = document.getElementById('root');
  ReactDOM.render(<h1>We love Mew! XD</h1>, rootEl);

  window.getState = store.getState;
  window.dispatch = store.dispatch;
 
});

window.fetchAllPokemon = fetchAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;
