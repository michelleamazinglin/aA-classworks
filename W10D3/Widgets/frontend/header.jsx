import React from 'react';

export default class Header extends React.Component {
    constructor(props){
        super(props);

        this.ourClickHandler = this.ourClickHandler.bind(this);
    }

    ourClickHandler(e) {
        this.props.changeIndex(this.props.index);
    }

    render() {
        return (
            <li className={this.props.selected ? "selected-tab" : ""}>
                <h1 onClick={this.ourClickHandler}>
                    {this.props.title}
                </h1>
            </li>
        )
    }
}