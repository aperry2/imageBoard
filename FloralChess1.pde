int zeroPoint = 127;
int factor = 21;
int sqSize = 100;

PImage pieces[];
PImage imgMask;
PImage placedImage;

void setup() {
    size(800, 800);
    noStroke();
    noLoop();
    background(zeroPoint);
    
    imgMask = loadImage("mask.jpg");
    placedImage = loadImage("mask.jpg");
    
    pieces = new PImage[12];
    
    pieces[0] = loadImage("Pieces/BlackKing.jpg");
    pieces[1] = loadImage("Pieces/BlackQueen.jpg");
    pieces[2] = loadImage("Pieces/BlackRook.jpg");
    pieces[3] = loadImage("Pieces/BlackBishop.jpg");
    pieces[4] = loadImage("Pieces/BlackKnight.jpg");
    pieces[5] = loadImage("Pieces/BlackPawn.jpg");

    pieces[6] = loadImage("Pieces/WhiteKing.jpg");
    pieces[7] = loadImage("Pieces/WhiteQueen.jpg");
    pieces[8] = loadImage("Pieces/WhiteRook.jpg");
    pieces[9] = loadImage("Pieces/WhiteBishop.jpg");
    pieces[10] = loadImage("Pieces/WhiteKnight.jpg");
    pieces[11] = loadImage("Pieces/WhitePawn.jpg");

    for (int i = 0; i < 12; i++) {
      pieces[i].resize(100, 0);
      pieces[i].mask(imgMask);
      pieces[i].resize(96, 0);
    }
}

void draw() {
  String[] lines = loadStrings("puzzles.txt");
      
  for (int i = 0; i < lines.length; i++) {
    if (i % 3 == 0) {
      drawBoard();
      
      String blackPlaces = lines[i + 1];
      String whitePlaces = lines[i + 2];
      
      String[] white = split(whitePlaces, " ");
      String[] black = split(blackPlaces, " ");
      
      drawPieces(white, black); //<>//
      
      save("chess" + (i / 3) + ".png");
    }
  }
}

void drawBoard() {
  color c = color(0);
  int iterator = 0;
  for (int i = 0; i < 8; i++) { //<>//
    for (int j = 0; j < 8; j++) { //<>//
      if (iterator % 2 == 1) {
        c = color(0);       
      } else {
        c = color(255);
      } //<>//
      fill(c); //<>//
      rect(i * sqSize, j * sqSize, sqSize, sqSize); //<>//
      iterator++;
    }
    iterator++;
  }
}

void drawPieces(String[] white, String[] black) {
 
  for (int piece = 0; piece < white.length; piece++) { //<>//
    int x = white[piece].charAt(1) - 97;
    int y = 56 - white[piece].charAt(2);
    drawPiece('w', white[piece].charAt(0), x, y);
  }
  
  for (int piece = 0; piece < black.length; piece++) {
    int x = black[piece].charAt(1) - 97;
    int y = 56 - black[piece].charAt(2);
    drawPiece('b', black[piece].charAt(0), x, y);
  }
}

void drawPiece(char set, char piece, int x, int y) {
  if (set == 'w') {
    // assign color for white pieces
    if (piece == 'P') { // pawn
      placedImage = pieces[11];
    } else if (piece == 'N') { // knight
            placedImage = pieces[10];
        } else if (piece == 'B')  { // bishop
            placedImage = pieces[9];
        } else if (piece == 'R') { // rook
            placedImage = pieces[8];
        } else if (piece == 'Q') { // queen
            placedImage = pieces[7];
        } else if (piece == 'K') { // king
            placedImage = pieces[6];
        } else {
            // should throw error
        }
    
  } else if (set == 'b') {
    // assign color for black pieces
    if (piece == 'P') { // pawn
      placedImage = pieces[5];
  } else if (piece == 'N') { // knight
            placedImage = pieces[4];
        } else if (piece == 'B')  { // bishop
            placedImage = pieces[3];
        } else if (piece == 'R') { // rook
            placedImage = pieces[2];        
        } else if (piece == 'Q') { // queen
            placedImage = pieces[1];        
        } else if (piece == 'K') { // king
            placedImage = pieces[0];        
        } else {
            // should throw error
        }
        
  }
  image(placedImage, x * 100 + 2, y * 100 + 2);
}