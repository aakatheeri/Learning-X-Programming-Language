#import <stdio.h>
#import "website.h"

Website addNewSite (char *url, char *name, int tag) {
    Website newWebsite;
    newWebsite.url = url;
    newWebsite.name = name;
    newWebsite.tag = tag;
    
    displayWebSite (newWebsite);
    
    return newWebsite;
}

void displayWebSite (Website website) {
    
    printf("Your (new) Website details: \n");
    printf("Website url: %s \n", website.url);
    printf("Website name: %s \n", website.name);
    printf("Website tag: %i \n", website.tag);
    
}

main () {
    
    // Add new website
    Website newSite = addNewSite("http://mubde3.net", "Mobde3 Blog", 1);
}