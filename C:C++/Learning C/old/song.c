#include <stdio.h>
#include "song.h"

Song make_song (int seconds, int year) {
    Song newSong;
    newSong.lengthInSeconds = seconds;
    newSong.yearRecorded = year;
    display_song(newSong);
    
    return newSong;
}

void display_song (Song theSong) {
    printf("the song is %i seconds long ", theSong.lengthInSeconds);
    printf("and was made in %i \n", theSong.yearRecorded);
}

main () {
    
    // Short way
    Song fifthSong = {290, 2003};
    display_song(fifthSong);
    
    // Long way
    Song thirdSong;
    thirdSong.lengthInSeconds = 230;
    thirdSong.yearRecorded = 1993;
    display_song(thirdSong);
    
    // Another way
    Song forthSong;
    int length = 230;
    int year = 1995;
    make_song(length, year);
    
    // Shortest way
    Song firstSong = make_song(200, 1988);
    Song secondSong = make_song(340, 1992);
    
}