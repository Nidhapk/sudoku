   /// The SudokuCell represents a single cell in a Sudoku grid.
  /// Each instance holds data about a specific cell, such as the number entered, 
 /// the correct number, whether it's a default (pre-filled) number, and its position.
//
class SudokuCell {

  String? value;                 /// The current value of the cell (user input or pre-filled).
  String? correctValue;         /// The correct value that should be in this cell.
  int? index;                  /// The index position of the cell in the Sudoku grid.
  bool isFocused = false;     /// Whether this cell is currently selected by the user.
  bool isCorrect;            /// Whether the entered value is correct.
  bool isDefault;           /// Whether this is a pre-filled (default) cell that cannot be changed.
  bool isActive = false;   /// Whether this cell is part of the active Sudoku grid.

  SudokuCell(
    this.value, {
    this.index,
    this.isDefault = false,
    this.correctValue,
    this.isCorrect = false,this.isActive=false
  });

  /// Checks if the entered value matches the correct value.
  bool get isCorrectPosition => correctValue == value;

  /// Updates the cell’s value and checks if it is correct.
  void setValue(String newValue) {
    value = newValue;
    isCorrect = isCorrectPosition;
  }

  /// Clears the cell value.
  void clear() {
    value = "";
    isCorrect = false;
  }
}
