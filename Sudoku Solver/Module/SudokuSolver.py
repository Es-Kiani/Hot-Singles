class SudokuSolver():
    def __init__(self, _puzzle=None):
        self._puzzle = _puzzle
        if self._puzzle:
            self._row_Count = len(self._puzzle)
            self._column_Count = len(self._puzzle[0])
        else:
            self._row_Count = 0
            self._column_Count = 0

        self._valid_Numbers = list(range(1, 10))
        return

    def print(self, puzzle=None):
        if puzzle:
            self.__init__(puzzle)

        for i in range(self._row_Count):
            if i % 3 == 0:
                print()

            for j in range(self._column_Count):
                if j % 3 == 0 and j != 0:
                    print("\t", end="")
                print(self._puzzle[i][j], end="")

            print()

    def _next_Empty(self):
        for i in range(self._row_Count):
            for j in range(self._column_Count):
                if self._puzzle[i][j] <= 0:
                    return i, j
        return None, None

    def _is_Empty(self):
        row, column = self._next_Empty()
        return True if row is None else False

    def _check_Valid(self, I, J, guessNum):
        row = self._puzzle[I]
        column = [self._puzzle[i][J] for i in range(self._row_Count)]
        square = []

        square_x = (I // 3) * 3
        square_y = (J // 3) * 3

        for i in range(square_x, square_x + 3):
            for j in range(square_y, square_y + 3):
                square.append(self._puzzle[i][j])

        neighbors = row + column + square
        if guessNum in neighbors:
            return False
        return True

    def start_Engine(self):
        row, col = self._next_Empty()

        # * Last Return
        if row is None:
            return True

        for guess in self._valid_Numbers:
            if self._check_Valid(row, col, guess):
                self._puzzle[row][col] = guess

                # * Recursive Algorithm
                if SudokuSolver(self._puzzle).start_Solver_Engine():
                    return True

            self._puzzle[row][col] = 0

        # * Return False If Puzzle Is Unsolvable
        return False

    def solve(self, puzzle=None):
        if puzzle:
            self.__init__(puzzle)

        if self._is_Empty():
            print("Your Puzzle Is Empty...")
            return -1

        is_Solved = self.start_Engine()

        if is_Solved:
            print("Puzzle Solved.\n See It: ")
            # * Print Solved Puzzle
            self.print()
            return True
        else:
            print("Sorry...\nThis Puzzle Is Unsolvable!")
            return False


#


# ? Puzzle Schematic:
#   0 0 0   0 0 0   0 0 0
#   0 0 0   0 0 0   0 0 0
#   0 0 0   0 0 0   0 0 0
#
#   0 0 0   0 0 0   0 0 0
#   0 0 0   0 0 0   0 0 0
#   0 0 0   0 0 0   0 0 0
#
#   0 0 0   0 0 0   0 0 0
#   0 0 0   0 0 0   0 0 0
#   0 0 0   0 0 0   0 0 0


#


# ? Real Puzzle For Solve:
# puzzle = [
#              [0, 0, 0,     1, 0, 2,     0, 3, 7],
#              [0, 0, 0,     4, 0, 9,     5, 8, 6],
#              [0, 0, 6,     0, 0, 8,     9, 0, 0],
#
#              [0, 7, 0,     0, 0, 0,     8, 6, 5],
#              [0, 0, 1,     6, 0, 0,     0, 0, 3],
#              [6, 3, 0,     2, 0, 0,     0, 0, 1],
#
#              [8, 1, 7,     3, 4, 5,     6, 2, 9],
#              [3, 9, 0,     0, 2, 0,     0, 5, 0],
#              [0, 6, 5,     0, 0, 0,     0, 0, 0]
# ]
# But You Must Remove "\t" and " " in Puzzle List Before Run Solver.
