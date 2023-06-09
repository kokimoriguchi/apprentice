import CalcDisplay from "./calcDisplay";
import NumberButton from "./numberButton";
import CalcNumber from "./calcNumber";
import { useState } from "react";
import Answer from "./answer";

export default function CalculatorApp() {
  const [displayValue, setDisplayValue] = useState("");
  const [decidedNumber, setDecidedNumber] = useState("");
  const [currentOperator, setCurrentOperator] = useState("");
  const [result, setResult] = useState("");

  const handleButtonClick = (value, type) => {
    switch (type) {
      case "number":
        setDisplayValue((prevValue) => prevValue + value);
        break;
      case "operator":
        if (currentOperator && displayValue) {
          calculateResult();
        }
        setCurrentOperator(value);
        setDecidedNumber(displayValue);
        setDisplayValue("");
        break;
      case "clear":
        setDisplayValue("");
        break;
      case "equal":
        calculateResult();
        setDisplayValue("");
        setCurrentOperator("");
        break;
      default:
        break;
    }
  };

  const calculateResult = () => {
    const num1 = parseFloat(decidedNumber);
    const num2 = parseFloat(displayValue);

    switch (currentOperator) {
      case "+":
        setResult(num1 + num2);
        break;
      case "-":
        setResult(num1 - num2);
        break;
      case "*":
        setResult(num1 * num2);
        break;
      case "/":
        setResult(num1 / num2);
        break;
      default:
        break;
    }
    setDecidedNumber("");
  };

  return (
    <div className=" bg-white py-6 sm:py-8 lg:py-12 mx-auto max-w-lg rounded-lg border">
      <div className="mx-auto max-w-screen-2xl px-4 md:px-8">
        <div className="mb-4 text-center text-2xl font-bold text-gray-800 md:mb-8 lg:text-3xl">
          <h2>CalculatorApp</h2>
          <div className="">
            <CalcDisplay displayValue={displayValue} />
          </div>
          <div className="grid grid-cols-4 ">
            <NumberButton onClick={handleButtonClick} />
            <CalcNumber decidedNumber={decidedNumber} />
            <br />
            <Answer result={result} />
          </div>
        </div>
      </div>
    </div>
  );
}
