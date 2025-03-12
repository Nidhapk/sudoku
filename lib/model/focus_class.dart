//// A class that manages focus selection within a Sudoku-like grid.
///
/// This class helps track which box and character (cell) are currently
/// selected, allowing UI components to highlight the focused cell.
/// 
class FocusClass {
  int? indexBox;          /// The index of the currently focused **box** (e.g., a 3x3 sub-grid in Sudoku).
  int? indexChar;       /// The index of the currently focused **character (cell)** within the box.

  void setData(int indexBox, int indexChar) {
    this.indexBox = indexBox;
    this.indexChar = indexChar;
  }
  ///
  /// Returns `true` if the provided `indexBox` and `indexChar` match the
  /// currently focused indices, otherwise returns `false`.
  bool focusOn(int indexBox, int indexChar) {
    return this.indexBox == indexBox && this.indexChar == indexChar;
  }
}
