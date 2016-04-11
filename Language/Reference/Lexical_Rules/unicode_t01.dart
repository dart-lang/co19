/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that the Latin capital letters are represented as a
 * sequence of Unicode  code points.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  List unicode = ["\u0041", "\u0042", "\u0043", "\u0044", "\u0045", "\u0046",
                  "\u0047", "\u0048", "\u0049", "\u004A", "\u004B", "\u004C",
                  "\u004D", "\u004E", "\u004F", "\u0050", "\u0051", "\u0052",
                  "\u0053", "\u0054", "\u0055", "\u0056", "\u0057", "\u0058",
                  "\u0059", "\u005A"];

  List character = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
                    "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X",
                    "Y", "Z"];

  Expect.listEquals(unicode, character);
}
