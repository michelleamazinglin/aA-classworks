import React from 'react';

export default class Header extends React.Component {
    constructor(){
        super();
    }

    render() {
        return(
            <li>
                <h1 onClick={this.changeIndex}>
                    {tab.title}
                </h1>
            </li>
        )
    }


}