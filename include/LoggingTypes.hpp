#ifndef LOGGING_TYPES_H
#define LOGGING_TYPES_H

#include <string>
#include "LoggingEnums.hpp"

class SocketLogger
{
    private:
        static bool log(LoggingLevel log_level, const std::string& log_string);

    friend class LoggingProxy;
};

class ConsoleLogger
{
    private:
        static bool log(LoggingLevel log_level, const std::string& log_string);    

    friend class LoggingProxy;
};

class FileLogger
{
    private:
        static std::string file_path;
        static std::string getFilePath();
        static void setFilePath(const std::string& _file_path);
        static bool log(LoggingLevel log_level, const std::string& log_string);

    friend class LoggingProxy;
    
    template<class...>
    friend class LoggingService;
};

#endif