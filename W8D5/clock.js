// HH:MM:SS

class Clock {
  constructor() {
    // 1. Create a Date object.
    const currentTime = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();
    // 3. Call printTime.
    this.printTime();

    // 4. Schedule the tick at 1 second intervals.
        const boundTick = this._tick.bind(this)
        setInterval(boundTick, 1000)
    //   setInterval(this.printTime() {}); }, 3000);

      
  }

  printTime() {
    // Format the time in HH:MM:SS
      console.log(this.hours + ":" + this.minutes + ":" + this.seconds);
    // Use console.log to print it.
      
  }

  _tick() {
    //   debugger;
    // 1. Increment the time by one second.
    this.addSeconds();
    // 2. Call printTime.
    this.printTime();
  }

  addSeconds() {
      this.seconds += 1;
      if (this.seconds === 60) {
          this.seconds = 0;
          this.minutes += 1;
      } 
  }

  addMinutes() {
    this.minutes += 1;
    if (this.minutes === 60) {
        this.minutes = 0;
        this.hours += 1;
    }
  }

    addHours() {
      this.hours += 1;
      if (this.hours === 24) {
          this.hours = 0;
        } 
    }

}


// Alert "Hello" every 3 seconds (3000 milliseconds):
// setInterval(function () { alert("Hello"); }, 3000);


// The getMinutes() method returns the minutes in the specified date according to local time.
// const birthday = new Date('March 13, 08 04:20');

// console.log(birthday.getMinutes());
// // expected output: 20
