import React from 'react';
import { render } from 'react-dom';

class Signup extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: '',
            email: '',
            password: '',
        };

        this.handleSubmit = this.handleSubmit.bind(this);
    }

    handleInput(type) {
        return (e) => {
            this.setState({ [type]: e.target.value })
            //anykey match the state will updated
        };
    }

    handleSubmit(e) {
        e.preventDeault();
        //the defalut method for a botton in a form will sent a post request
        // we dont want it to rerender
        this.props.createNewUser(this.state)
            .then( () => this.props.history.push('/chirps'));
    }

    render () {
        return (
            <div className="session-form">
                <h2>Sign up!</h2>
                <form>
                    <label>Username: 
                    <input type="text" 
                            value={this.state.username}
                            onChange={this.handleInput('username')}
                    />
                    </label>
                    <label>Email:
                    <input type="text"
                            value={this.state.email}
                            onChange={this.handleInput('email')}
                        />
                    </label>
                    <label>Password:
                    <input type="password"
                            value={this.state.password}
                            onChange={this.handleInput('password')}
                        />
                    </label>
                    <button onClick={this.handleSubmit}>Sign Up</button>
                    {/* PROBLEM HERE: handleSubmit needs to be bound to the current scope of the instence of the sign up component*/}
                </form>
            </div>
        );
    }
};

export default Signup;