Bootstrap (0 - 64)
Push[4] (356 - 361)
* Call Main.fibonacci 1 (362 - 407)
    Push[arg0] (65 - 71)
    Push[2] (72 - 77)
    lt (78 - 91)
    if-goto[IF_TRUE] (92 - 97)
    goto[IF_FALSE] (98 - 99)
    push[arg0] (161 - 167)
    push[2] (168 - 173)
    sub (174 - 181)
    * Call Main.fibonacci 1 (182 - 227)
        Push[arg0] (65 - 71)
        Push[2] (72 - 77)
        lt (78 - 91)
        if-goto[IF_TRUE] (92 - 97)
        goto[IF_FALSE] (98 - 99)
        push[arg0] (161 - 167)
        push[2] (168 - 173)
        sub (174 - 181)
        * Call Main.fibonacci 1 (182 - 227)
            Push[arg0] (65 - 71)
            Push[2] (72 - 77)
            lt (78 - 91)
            if-goto[IF_TRUE] (92 - 97) ERROR: Did not go to true
        

