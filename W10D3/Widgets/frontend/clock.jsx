import React from 'react';

export default class Clock extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            date: new Date()
        };

        this.tick = this.tick.bind(this);
    }

    tick() {
        this.setState({date: new Date()});
    }

    componentDidMount() {
        this.intervalId = setInterval(() => {
            this.tick();
        }, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.intervalId);
    }

    render() {
        let hours = this.state.date.getHours();
        let minutes = this.state.date.getMinutes();
        let seconds = this.state.date.getSeconds();
        return (
            <>
                <div className="clock">
                <h1>Clock</h1>
                <div className="clock-display">
                    <div className="time">
                        <span>Time:</span>
                        <span>{hours}:{minutes}:{seconds}</span>
                    </div>
                    <div className="date">
                        <span>Date:</span>
                        <span>{this.state.date.toDateString()}</span>
                    </div>
                </div>
                </div>
            </>
        )
    }
}
