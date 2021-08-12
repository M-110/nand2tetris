Bootstrap (0 - 64)
Push[6,8] (65 - 76)
* Class1.set 2 (77 - 123)
    Push/Pop[Arg0->static0], Push/Pop[Arg1->static1], Push[0] (287-318)
    * return (319 - 372)   // Why is R14 = 142 instead of 28
Pop[temp0] (124 - 129)
Push[23] (130 - 135)
Push[15] (136 - 141)
* Class2.set 2 (142 - 188)
    Push[arg0] (447 - 453)
    Pop[static0] (454 - 459)
    Push[arg1] (460 - 466)
    Pop[static1] (467 - 472)
    Push[0] (473 - 478)
    * return (479 - 532)  // Now R14 is 32 instead of 189 (Maybe it's return address)
Pop[temp0] (189 - 194)
* Class1.get 0 (195 - 239)
    Push[static0] (373 - 378) // ERROR: They pushed 6, I pushed 23
    Push[static1] (379 - 384) // ERROR: They pushed 8, I pushed 15
    sub (385 - 392) // ERROR: they got -2, I got 8
    * return (393 - 446)
* Class2.get 0 (240 - 284)
    Push[static0] (533 - 538) // We both pushed 23
    Push[static1] (539 - 544) // We both pushed 15
    sub (545 - 552) // We both get 15
    * return (553 - 606)
* While repeating (285 - 286)


