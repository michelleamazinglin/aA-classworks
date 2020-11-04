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

    changeIndex(idx) {
        this.setState({selectedIndex: idx});
    }

    render() {
        const tabsList = this.props.array.map ((tab, idx) => {
            return <Header key={idx} index={idx} title={tab.title}
                           changeIndex={this.changeIndex}
                           selected={this.state.selectedIndex === idx}/>
        });
        return (
            <>
                <ul>
                   {tabsList}
                </ul>
                <article>
                    {this.props.array[this.state.selectedIndex].content}
                </article>
            </>
        )
    }
}