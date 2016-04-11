/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that the Arabic numerals are represented as a sequence
 * of Unicode code points.
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  List unicode = ["\u0030", "\u0031", "\u0032", "\u0033", "\u0034",
                  "\u0035", "\u0036", "\u0037", "\u0038", "\u0039"];
  List character = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  Expect.listEquals(unicode, character);
}
