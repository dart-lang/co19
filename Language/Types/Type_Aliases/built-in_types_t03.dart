/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks use of type aliases for built-in types as return values
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;
typedef NumAlias = num;
typedef DoubleAlias = double;
typedef BoolAlias = bool;
typedef StringAlias = String;

int fooInt(IntAlias i) => i;
num fooNum(NumAlias n) => n;
double fooDouble(DoubleAlias d) => d;
bool fooBool(BoolAlias b) => b;
String fooString(StringAlias s) => s;

main() {
  IntAlias i = 1;
  NumAlias n = 3.14;
  DoubleAlias d = 3.1415;
  BoolAlias b = true;
  StringAlias s = "Lily was here";

  Expect.equals(1, fooInt(i));
  Expect.equals(3.14, fooNum(n));
  Expect.equals(3.1415, fooDouble(d));
  Expect.isTrue(fooBool(b));
  Expect.equals("Lily was here", fooString(s));

  i = 3;
  n = 1;
  d = 4;
  b = false;
  s = "Run, Forrest, Run!";

  Expect.equals(3, fooInt(i));
  Expect.equals(1, fooNum(n));
  Expect.equals(4, fooDouble(d));
  Expect.isFalse(fooBool(b));
  Expect.equals("Run, Forrest, Run!", fooString(s));
}
