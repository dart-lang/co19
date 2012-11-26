/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code points normalized
 * to Unicode Normalization Form C.
 * @description Checks that various whitespaces are represented
 * as a sequence of Unicode code points.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview TODO enter 0a and 0d properly
 */

main() {
  /*
  List unicode = ["\u2029", "\u2028", "\u0085", "\u000b", "\u000c", "\u00a0",
                  "\u1680", "\u180E", "\u2000", "\u2001", "\u2002", "\u2003",
                  "\u2004", "\u2005", "\u2006", "\u2007", "\u2008", "\u2009",
                  "\u200a", "\u200b", "\u200c", "\u200d", "\u202f", "\u205f",
                  "\u2060", "\u3000", "\ufeff"];

  List character = [r" ",  r" ", r'',  r"", r"", r" ",
                    r" ", r"᠎",  r" ", r" ", r" ", r" ",
                    r" ", r" ", r" ", r" ", r" ", r" ",
                    r" ", r"​",  r"‌",  r"‍",  r" ", r" ",
                    r"⁠",  r"　", r"﻿" ];
  */
  
  List unicode = [//"\u000a", "\u000d", 
                  "\u0009", "\u000b", "\u000c", "\u0020", "\u0085", "\u00a0", 
                  "\u1680", "\u180e", "\u2000", "\u2001", "\u2002", "\u2003", 
                  "\u2004", "\u2005", "\u2006", "\u2007", "\u2008", "\u2009", 
                  "\u200a", "\u2028", "\u2029", "\u202f", "\u205f", "\u3000"];
  
  List character = [
//r"""
//""",
//r"""
//""",
                    r"	", r"", r"", r" ", r"", r" ", 
                    r" ", r"᠎", r" ", r" ", r" ", r" ", 
                    r" ", r" ", r" ", r" ", r" ", r" ", 
                    r" ", r" ", r" ", r" ", r" ", r"　"];

  Expect.listEquals(unicode, character);
}
