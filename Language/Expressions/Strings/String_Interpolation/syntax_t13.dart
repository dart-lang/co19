/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string
 * literals, such that these expressions are evaluated, and the resulting
 * values are converted into strings and concatenated with the enclosing
 * string. This process is known as string interpolation.
 * stringInterpolation:
 *   '$' IDENTIFIER_NO_DOLLAR |
 *   '$' '{' expression '}'
 * ;
 * @description Checks that the identifier is parsed in a greedy manner and the
 * entire substring from the '$' character to the first non-identifier or '$'
 * character is used, even if there're shorter matches for lexically visible
 * identifiers.
 * @author rodionov
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

main() {
  var fo = "bar", foo = "foo123";
  Expect.equals(foo, "$foo");
}
