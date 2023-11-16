#include <stdio.h>
#include <syslog.h>

int main(int argc, char* argv[]) {
    // Open the connection to the system logger
    openlog("finder-app", LOG_PID, LOG_USER);

    // Log a message to the system logger
    syslog(LOG_INFO, "finder-app started");

    char* filename = argv[1];
    char* string = argv[2];

    if (string == NULL || filename == NULL) {
        syslog(LOG_ERR, "Missing arguments");
        return 1;
    }

    FILE* file = fopen(filename, "w");
    if (file != NULL) {
        fprintf(file, "%s", string);
        fclose(file);
        syslog(LOG_DEBUG, "Writing %s to %s", string, filename);
    } else {
        syslog(LOG_ERR, "Failed to open file %s", filename);
    }

    // Close the connection to the system logger
    closelog();

    return 0;
}

