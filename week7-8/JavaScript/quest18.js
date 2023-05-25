function checkDivisibleByFive(num) {
  // 処理を記述
  try {
    if (num % 5 !== 0) {
      throw new Error("数値は5で割り切れません");
    }
    console.log(true);
  } catch (event) {
    console.log(event.message);
  }
}
checkDivisibleByFive(7);
