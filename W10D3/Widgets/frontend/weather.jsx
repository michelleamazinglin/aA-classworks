import React from 'react'

export default class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            weather: null
        }
    }

    componentDidMount() {
        let results;
        navigator.geolocation.getCurrentPosition(this.success);
    }
    
    success(position) {
        // debugger;
        const apiKey = "3ca7b42669aa7a1cc5cf8243013051c1";
        const params = {
            latitude: position.coords.latitude,
            longitude: position.coords.longitude
        };
        const url = `http://api.openweathermap.org/data/2.5/weather?lat=${params.latitude}&lon=${params.longitude}&appid=${apiKey}`;
        const xmlhttp = new XMLHttpRequest();
        // console.log(xmlhttp.responseURL);
        // xmlhttp.onload = () => {
        //     console.log(xmlhttp.responseURL);
        // }
        xmlhttp.onreadystatechange = function () {
            debugger;
            if (xmlhttp.readyState == XMLHttpRequest.DONE) {   // XMLHttpRequest.DONE == 4
                if (xmlhttp.status == 200) {
                    // document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
                    console.log(`The response is: ${xmlhttp.responseText}`);
                } else if (xmlhttp.status == 400) {
                    alert('There was an error 400');
                } else {
                    alert('something else other than 200 was returned');
                }
        }
        xmlhttp.open("GET", url);
      }
    }

    render() {
        return (
            <>
                <h1>Weather</h1>
                <div className="weather">
                    <div className="location">hahahahah</div>
                    <div className="degree">hahahaahahahah</div>
                </div>
            </>
        )
    }
}

//api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}