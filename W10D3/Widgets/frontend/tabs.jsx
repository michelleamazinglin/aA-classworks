import React from 'react';
import Header from './header';

export default class Tabs extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selectedIndex: 0
        };

        this.changeIndex = this.changeIndex.bind(this);
    }

    // changeIndex() {
    //     this.setState({selectedIndex: });
    // }

    render() {
        const tabsList = this.props.array.map ((tab, idx) => {
            return (
                // <li key={idx}>
                //     <h1 onClick={this.changeIndex}>
                //         {tab.title}
                //     </h1>
                //     <article>{tab.content}</article>
                // </li>
                <Header key={idx} title = {tab.title} content = {tab.content}/>
            )
        });
        return (
            <>
                <ul>
                   {tabsList}
                </ul>
            </>
        )
    }
}