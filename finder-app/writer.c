#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
    // Open syslog for logging using the LOG_USER facility
    openlog(NULL, 0, LOG_USER);

    // Exits with an error if any of the arguments are not provided
    if (argc < 2 || argc > 3) {
        syslog(LOG_ERR, "Insufficient arguments provided. Expected exactly 2 arguments.");
        closelog();
        return 1;
    }

    // Extract writefile and writestr from command line arguments
    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file %s for writing: %m", writefile);
        closelog();
        return 1;
    }

    // Log a message to LOG_DEBUG level
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    // Write the string to the file
    if (fprintf(file, "%s\n", writestr) < 0) {
        syslog(LOG_ERR, "Failed to write to file %s: %m", writefile);
        fclose(file);
        closelog();
        return 1;
    }

    // Close syslog
    closelog();

    return 0;
}