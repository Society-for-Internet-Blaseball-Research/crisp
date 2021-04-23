////////////////////////////////////////////////////////////
// UI.h

#ifndef UI_H
#define UI_H


class UI
{
  public:
    enum Mode {NONE, UIT, OI, ZAPP, ascii};

    static void init(Mode m) { mode = m; }
    virtual ~UI() {}
    virtual void display() = 0;
    virtual void hide() = 0;
    static Mode mode;
};

#endif
