const NumberButton = ({ onClick }) => {
  const handleButtonClick = (event) => {
    const buttonText = event.target.textContent;
    const buttonValue = event.target.value;
    onClick(buttonText, buttonValue);
  };
  return (
    <>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        1
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        2
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        3
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="operator"
      >
        +
      </button>{" "}
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        4
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        5
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        6
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="operator"
      >
        -
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        7
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        8
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        9
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="operator"
      >
        *
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="number"
      >
        0
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="clear"
      >
        C
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="operator"
      >
        /
      </button>
      <button
        className="rounded-lg border border-gray-300  hover:bg-gray-100 focus-visible:ring"
        onClick={handleButtonClick}
        value="equal"
      >
        =
      </button>
    </>
  );
};
export default NumberButton;
