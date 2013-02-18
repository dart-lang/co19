/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Concatenates all the given strings to create a new string.
 * @description Checks that strings from the provided list are concatenated
 *              correctly
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("", Strings.concatAll([]));
  Expect.equals("foobar", Strings.concatAll([ "foo", "", "bar" ]));
  Expect.equals("", Strings.concatAll([ "", "", "" ]));
  Expect.equals("12345", Strings.concatAll([ "1", "2", "3", "4", "5" ]));
  Expect.equals("string", Strings.concatAll([ "string" ]));
}
