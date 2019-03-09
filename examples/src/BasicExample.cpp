#include "LoggingService.hpp"

int main (int argc, char** argv)
{
    LoggingService<ConsoleLogger, FileLogger> logger;
    logger.setFileOutput("./file_output_test.txt");
    logger.log(LoggingLevel::SUCCESS, std::string("Successfully logged to console and file."));

    LoggingService<ConsoleLogger, SocketLogger> logger2;
    logger2.log(LoggingLevel::SUCCESS, std::string("Succesfullt logged to console and socket."));

    return 0;
}