import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Tic Tac Toe',
      home: Scaffold(
        body: Container(
          color: Colors.black, 
          child: Center(
            child: Board(),
          ),
        ),
      ),
    );
  }
}

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<List<String>> _board = [];
  String _currentPlayer = '';
  String _winner = '';

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    _board = List.generate(3, (_) => List.filled(3, ''));
    _currentPlayer = 'X';
    _winner = 'Start';
  }

  void _markCell(int row, int col) {
    if (_board[row][col] == '' && _winner == 'Start') {
      setState(() {
        _board[row][col] = _currentPlayer;
        if (_checkWinner(row, col)) {
          _winner = _currentPlayer;
        } else if (_checkDraw()) {
          _winner = 'Draw';
        } else {
          _currentPlayer = (_currentPlayer == 'X') ? 'O' : 'X';
        }
      });
    }
  }

  bool _checkWinner(int row, int col) {
    // Check row
    if (_board[row][0] == _board[row][1] && 
        _board[row][1] == _board[row][2] && 
        _board[row][0].isNotEmpty ) {
      return true;
    }
    // Check column
    if (_board[0][col] == _board[1][col] && 
        _board[1][col] == _board[2][col] && 
        _board[0][col].isNotEmpty ) {
      return true;
    }
    // Check diagonals
    if ((row == col || row + col == 2) &&
        ((_board[0][0] == _board[1][1] && _board[1][1] == _board[2][2]) ||
          (_board[0][2] == _board[1][1] && _board[1][1] == _board[2][0])) &&
        _board[1][1].isNotEmpty){
      return true;
    }
    return false;
  }

  bool _checkDraw() {
    for (var row in _board) {
      for (var cell in row) {
        if (cell == '') {
          return false;
        }
      }
    }
    return true;
  }

  void _resetGame() {
    setState(() {
      _initializeBoard();
    });
  }

  Widget _buildCell(int row, int col) {
    Color cellColor = Colors.black;
    if (_board[row][col] == 'X') {
      cellColor = Color.fromARGB(99, 40, 149, 238);
    } else if (_board[row][col] == 'O') {
      cellColor = Color.fromARGB(110, 248, 74, 62);
    }

    return GestureDetector(
      onTap: () {
        _markCell(row, col);
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: cellColor,
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            _board[row][col],
            style: TextStyle(fontSize: 40.0, color: cellColor),
          ),
        ),
      ),
    );
  }

   @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (_winner != 'Start')
                Column(
                  children: [
                    Text(
                      _winner == 'Draw' ? 'Its a Draw!' : 'Winner: $_winner',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
              SizedBox(height: 20.0,),
              for (int i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int j = 0; j < 3; j++) _buildCell(i, j),
                  ],
                ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.black,
          child: ElevatedButton(
            onPressed: _resetGame,
            child: Text('Play Again', style: TextStyle(fontSize: 20.0)),
          ),
        ),
      ],
    );
  }
}






