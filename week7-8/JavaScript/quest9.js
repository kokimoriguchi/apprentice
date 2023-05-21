const checkTemperature = (temperature) => {
  if (temperature >= 30) {
    console.log("HOT");
  } else if( temperature > 15 && temperature < 30 ) {
    console.log("WARM");
  } else if(temperature < 15) {
    console.log("COLD");
  } else {
    console.log("ERROR");
  }
};
checkTemperature(30)

const checkOddOrEven = (n) => {
  if (n % 2 === 0) {
    console.log("Even");
  } else {
    console.log("Odd");
  }
};
checkOddOrEven(9)