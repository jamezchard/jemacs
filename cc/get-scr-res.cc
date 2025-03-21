#include <iostream>

#ifdef _WIN32
#include <windows.h>
#else
#include <X11/Xlib.h>
#endif

int main()
{
    int screen_width;
    int screen_height;

#ifdef _WIN32
    // Windows
    screen_width = GetSystemMetrics(SM_CXSCREEN);
    screen_height = GetSystemMetrics(SM_CYSCREEN);
#else
    // Linux. not tested.
    Display *display = XOpenDisplay(nullptr);
    if (!display)
    {
        std::cerr << "Failed to open X display" << std::endl;
        return 1;
    }

    Screen *screen = DefaultScreenOfDisplay(display);
    screen_width = screen->width;
    screen_height = screen->height;

    XCloseDisplay(display);
#endif

    std::cout << screen_width << "x" << screen_height << std::endl;

    return 0;
}
