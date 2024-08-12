#include "crow.h"

int main()
{
    crow::SimpleApp app;

    CROW_ROUTE(app, "/")([](){
        return "Hello, Crow! Gurnish";
    });

    app.port(8080).multithreaded().run();
}
