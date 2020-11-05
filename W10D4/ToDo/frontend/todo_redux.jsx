import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

function Root () {
    
return (
    <>
        <h1>Todos App</h1>
    </>
)
}

document.addEventListener('DOMContentLoaded', () => {
    
    ReactDOM.render(<Root store={configureStore}/>, document.getElementById("content"));
    window.store = configureStore;
});