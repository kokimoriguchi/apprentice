// 画面上で緯度以前の経度を入力し、「天気情報を取得する」ボタンを押して、摂氏温度、および天気の説明を表示してください。
// 天気情報の取得は、Fetch API を使用して、OpenWeather API への HTTP リクエストを処理することで実現してください。
// 以下のコードを元に、天気予報アプリを作成してください。

const apiKey = ""; // 自分の OpenWeatherMap API キーに置き換えてください

// 都市名や緯度経度などのパラメータを指定して天気情報を取得する関数

// 関数を呼び出して天気情報を取得
//getWeatherInfo(43.064171, 141.346939); // 取得したい都市名を指定

//HTMLのID取得
const latitude = document.getElementById("latitude");
const longitude = document.getElementById("longitude");
const submit = document.getElementsByTagName("button")[0];
const result = document.getElementById("weatherResult");
const display = document.createElement("p");
result.appendChild(display);
let displayData = [];

async function getWeatherInfo(lat, lon) {
  try {
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${apiKey}`;
    const response = await fetch(url);
    const data = await response.json();
    console.log(data);

    // 取得したデータを使って必要な処理を行う
    const name = data.name;
    const weather = data.weather[0].main;
    displayData.push(name, weather);
    console.log(name);
    console.log(weather);
    display.textContent = displayData.join(", ");
  } catch (error) {
    console.error("天気情報の取得に失敗しました:", error);
  }
}

submit.addEventListener("click", function (event) {
  event.preventDefault();
  const newLatitudeData = latitude.value;
  const newLongitudeDate = longitude.value;
  getWeatherInfo(newLatitudeData, newLongitudeDate);
  longitude.value = "";
  latitude.value = "";
});
