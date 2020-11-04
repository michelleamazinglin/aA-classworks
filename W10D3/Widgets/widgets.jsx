import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';

const Root = () => {
  const tabsArray = [
    { title: 'one', content: 'I am the first'},
    { title: 'two', content: 'Second pane here' },
    { title: 'three', content: 'Third pane here' },
  ];
  return (
    <div>
      <Clock />
      <Tabs array={tabsArray}/>
    </div>
  );
}

document.addEventListener("DOMContentLoaded", () => {
  const main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
});