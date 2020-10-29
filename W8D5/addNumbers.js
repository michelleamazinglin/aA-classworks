// const { cpuUsage } = require("process");
const readline = require("readline");
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    // debugger;
    if (numsLeft === 0) {
        completionCallback(sum);
        reader.close();
    } else {
        reader.question('Pass in a number: ', function (answer) { 
            const numInteger = parseInt(answer);
            sum += numInteger;
            console.log(sum);
            addNumbers(sum, numsLeft - 1, completionCallback);
        });
    }
};
addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));