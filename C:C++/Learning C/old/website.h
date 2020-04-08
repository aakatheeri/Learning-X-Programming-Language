typedef struct {
    char *url;
    char *name;
    int tag;
} Website;

Website addNewSite (char *url, char *name, int tag);
void displayWebSite (Website website);