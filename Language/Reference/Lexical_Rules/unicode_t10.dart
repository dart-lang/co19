/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that various whitespaces represented in UTF-8 format are
 * recognized as Unicode code points.
 * @author iefremov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

  List<String> unicode = [
     "\u0009", "\u000a", "\u000b", "\u000c",
     //"\u000d", -- problematic character, converted to 0x0A by dart
     "\u0020", "\u0085", "\u00a0", "\u1680", "\u180e",
     "\u2000", "\u2001", "\u2002", "\u2003", "\u2004",
     "\u2005", "\u2006", "\u2007", "\u2008", "\u2009",
     "\u200a", "\u202f", "\u205f", "\u3000", "\ufeff"
    ];

  List characters = [
    r''':	''', r''':
''', r''':''', r''':''', //r''':
//''',
    r''': ''', r''':''', r''': ''', r''': ''', r''':᠎''',
    r''': ''', r''': ''', r''': ''', r''': ''', r''': ''',
    r''': ''', r''': ''', r''': ''', r''': ''', r''': ''',
    r''': ''', r''': ''', r''': ''', r''':　''', r''':﻿'''
  ];

main() {
  Expect.equals(unicode.length, characters.length);
  for (int k = 0; k < unicode.length; k++) {
    String str1 = unicode[k];
    String str2 = characters[k];
    int code1 = str1.codeUnitAt(0);
    int code2 = str2.codeUnitAt(1);
    Expect.equals(code1, code2, "code at $k");
  }
}
