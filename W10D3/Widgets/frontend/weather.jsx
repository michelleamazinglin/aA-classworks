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
        navigator.geolocation.getCurrentPosition(position => results = position);
        const apiKey = "3ca7b42669aa7a1cc5cf8243013051c1";
        const params = {
            latitude: results.coords.latitude,
            longitude: results.coords.longitude
        };
        const url = `http://api.openweathermap.org/data/2.5/weather?lat=${params.latitude}&lon=${params.longitude}&appid=${apiKey}`;
        const xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", url);
        xmlhttp.onload = () => {
            console.log(xmlhttp.responseURL);
        }

    }

    /*
    <script type="text/javascript">
function loadXMLDoc() {
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE) {   // XMLHttpRequest.DONE == 4
           if (xmlhttp.status == 200) {
               document.getElementById("myDiv").innerHTML = xmlhttp.responseText;
           }
           else if (xmlhttp.status == 400) {
              alert('There was an error 400');
           }
           else {
               alert('something else other than 200 was returned');
           }
        }
    };

    xmlhttp.open("GET", "ajax_info.txt", true);
    xmlhttp.send();
}
</script>
    */

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