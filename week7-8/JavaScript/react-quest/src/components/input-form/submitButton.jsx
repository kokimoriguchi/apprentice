const SubmitButton = (onClick) => {
  return (
    <button
      className="gap-2 rounded-lg bg-blue-500 px-8 py-3 text-center text-sm font-semibold text-white outline-none ring-blue-300 transition duration-100 hover:bg-blue-600 focus-visible:ring active:bg-blue-700 md:text-base"
      onClick={onClick}
    >
      タスクを追加する
    </button>
  );
};
export default SubmitButton;
