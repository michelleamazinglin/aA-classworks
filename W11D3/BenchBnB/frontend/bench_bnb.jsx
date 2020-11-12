import React from "react";
import ReactDOM from "react-dom";
import {
  signup,
  signin,
  signout
} from './util/session_api_util';
import configureStore from './store/store'

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  const store = configureStore();

  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);

  // testing 
  window.signup = signup;
  window.signin = signin;
  window.signout = signout;
  window.getState = store.getState;
  window.dispatch = store.dispatch; 
});