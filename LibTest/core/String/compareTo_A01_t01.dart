/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion returns -1 if the string is lexicographically less then [other],
 * 1 if it is greater than [other] and 0 if the strings are equal
 * @description Checks that this method returns the correct value
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main()
{
  Expect.equals(0, "".compareTo(""));
  Expect.equals(-1, "".compareTo("a"));

  Expect.equals(-1, "ABC".compareTo("abc"));
  Expect.equals(1, "abc".compareTo("ABC"));

  Expect.equals(-1, "a".compareTo("b"));
  Expect.equals(0, "a".compareTo("a"));
  Expect.equals(1, "baaaaaaaaaaaaa".compareTo("a"));

  Expect.equals(1, "\uffff".compareTo("\ufffe"));
}
