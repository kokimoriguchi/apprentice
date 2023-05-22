const hasOdd = (numbers) => {
  for (let i = 0; i < numbers.length; i++ ){
    if (numbers[i] % 2 !== 0){
      console.log(true)
    }
  }
  console.log(false)
};
hasOdd([1,2,3,4,5]);

const odd = (numbers) => {
  for (let i = 0; i < numbers.length; i++ ){
    if (numbers[i] % 2 !== 0){
      console.log(numbers[i])
    }
  }
}
odd([1,2,3,4,5])

const square = (numbers) => {
  const result = [];
  for (let i = 0; i < numbers.length; i++){
    const square_numbers = numbers[i] ** 2;
    result.push(square_numbers);
  }
  console.log(result)
}
square([1,2,3,4,5])