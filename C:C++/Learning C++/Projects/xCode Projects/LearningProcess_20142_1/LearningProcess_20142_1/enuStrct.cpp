#include <iostream>
using namespace std;

struct cPosition {
    float x;
    float y;
};

struct cSize {
    float width;
    float height;
};

struct cArea {
    cSize size;
    cPosition position;
};

cArea initWithScreen (cSize size, cPosition position) {
    cArea area;
    area.size = size;
    area.position = position;
    return area;
}

cSize initWithSize (float width, float height) {
    cSize size;
    size.width = width;
    size.height = height;
    return size;
}

cPosition initWithPosition (float x, float y) {
    cPosition position;
    position.x = x;
    position.y = y;
    return position;
}

enum Color {
    cWhite,
    cBlack,
    cRed,
    cBlue,
    cGreen,
    cCyan
};

string colorToString (Color color) {
    string colorInString;
    if (color == cWhite) {
        colorInString = "White";
    } else if (color == cBlack) {
        colorInString = "Black";
    } else if (color == cRed) {
        colorInString = "Red";
    } else if (color == cBlue) {
        colorInString = "Blue";
    } else if (color == cGreen) {
        colorInString = "Green";
    } else if (color == cCyan) {
        colorInString = "Cyan";
    }
    
    return colorInString;
}

// Main function
/*
int main () {
    
    cSize size = initWithSize(460, 320);
    cPosition position = initWithPosition(0, 0);
    cArea screen = initWithScreen(size, position);
    
    cout << "The width of screen is " << screen.size.width << endl;
    cout << "The height of screen is " << screen.size.height << endl;
    exit(0);
    cout << "The [x] positin of screen is " << screen.position.x << endl;
    cout << "The [y] position of screen is " << screen.position.y << endl;
    
    return 0;
} */