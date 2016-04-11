/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that Latin small letters are represented as a sequence
 * of Unicode code points.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  List unicode = ["\u0061", "\u0062", "\u0063", "\u0064", "\u0065", "\u0066",
                  "\u0067", "\u0068", "\u0069", "\u006A", "\u006B", "\u006C",
                  "\u006D", "\u006E", "\u006F", "\u0070", "\u0071", "\u0072",
                  "\u0073", "\u0074", "\u0075", "\u0076", "\u0077", "\u0078",
                  "\u0079", "\u007A"];

  List character = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
                    "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x",
                    "y", "z"];

  Expect.listEquals(unicode, character);
}
