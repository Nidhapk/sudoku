import 'package:sudoku/model/sudokucell.dart';

/// Represents a 3x3 subgrid (box) in a Sudoku board.
class BoxInner {
  /// The index of this 3x3 box within the Sudoku grid.
  late int index;

  /// The list of `BlokChar` objects representing the individual Sudoku cells within this box.
  List<SudokuCell> blokChars = List<SudokuCell>.from([]);

  /// Constructor to initialize the box with an index and a list of Sudoku cells.
  BoxInner(this.index, this.blokChars);

  /// Highlights all cells in the **same row or column inside this 3x3 box**.
  ///
  /// - [index]: The index of the selected cell.
  /// - [direction]: Whether to highlight **horizontally** (row) or **vertically** (column).
  void setFocus(int index, Direction direction) {
    List<SudokuCell> temp;

    // Highlighting within the same 3x3 box, NOT the full Sudoku grid
    if (direction == Direction.horizontal) {
      temp = blokChars
          .where((element) => element.index! ~/ 3 == index ~/ 3)
          .toList();
    } else {
      temp = blokChars
          .where((element) => element.index! % 3 == index % 3)
          .toList();
    }

    // Mark the filtered cells as focused
    for (var element in temp) {
      element.isFocused = true;
    }
  }

  /// Checks if a number already exists within the same **row or column inside this 3x3 box**.
  ///
  /// - [index]: The index of the selected cell.
  /// - [indexBox]: The index of the 3x3 box.
  /// - [textInput]: The number being checked.
  /// - [direction]: Whether to check **horizontally** (row) or **vertically** (column).
  void setExistValue(int index, int indexBox, String textInput, Direction direction) {
    List<SudokuCell> temp;

    // Checking within the same 3x3 box row or column (not full Sudoku row/column)
    if (direction == Direction.horizontal) {
      temp = blokChars
          .where((element) => element.index! ~/ 3 == index ~/ 3)
          .toList();
    } else {
      temp = blokChars
          .where((element) => element.index! % 3 == index % 3)
          .toList();
    }

    // If this box is the same as the selected one, check for existing values
    if (this.index == indexBox) {
      List<SudokuCell> blokCharsBox =
          blokChars.where((element) => element.value == textInput).toList();

      // If only one instance of the number exists and it's not in the same row/column, clear it
      if (blokCharsBox.length == 1 && temp.isEmpty) blokCharsBox.clear();

      temp.addAll(blokCharsBox);
    }

    // Mark all matching numbers as "existing"
    for (var element in temp.where((element) => element.value == textInput)) {
      element.isActive = true;
    }
  }

  /// Clears the focus highlight from all cells in this 3x3 box.
  void clearFocus() {
    for (var element in blokChars) {
      element.isFocused = false;
    }
  }

  /// Clears the existence flag from all cells in this 3x3 box.
  void clearExist() {
    for (var element in blokChars) {
      element.isActive = false;
    }
  }
}

/// Enum representing the direction of movement in the Sudoku grid.
enum Direction { 
  /// Represents horizontal movement (row-wise).
  horizontal, 

  /// Represents vertical movement (column-wise).
  vertical 
}
