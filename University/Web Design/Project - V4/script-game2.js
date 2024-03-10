let currentPlayer = "X";
let gameBoard = ["", "", "", "", "", "", "", "", ""];
const board = document.getElementById("board");
const cells = document.getElementsByClassName("cell");

function makeMove(index) {
  if (gameBoard[index] === "") {
    gameBoard[index] = currentPlayer;
    cells[index].textContent = currentPlayer;
    if (checkWinner()) {
      setTimeout(() => alert(`${currentPlayer} wins!`), 50);
    } else if (isBoardFull()) {
      setTimeout(() => alert("It's a tie!"), 50);
    } else {
      currentPlayer = currentPlayer === "X" ? "O" : "X";
    }
  }
}

function checkWinner() {
  const winCombinations = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], 
    [0, 3, 6], [1, 4, 7], [2, 5, 8], 
    [0, 4, 8], [2, 4, 6], 
  ];

  for (const combination of winCombinations) {
    const [a, b, c] = combination;
    if (gameBoard[a] && gameBoard[a] === gameBoard[b] && gameBoard[a] === gameBoard[c]) {
      return true;
    }
  }

  return false;
}

function isBoardFull() {
  return gameBoard.every((cell) => cell !== "");
}

function resetGame() {
  gameBoard = ["", "", "", "", "", "", "", "", ""];
  currentPlayer = "X";
  Array.from(cells).forEach((cell) => cell.textContent = "");
}

resetGame();