/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks use of type aliases for built-in types as function
 * arguments
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

typedef IntAlias = int;
typedef NumAlias = num;
typedef DoubleAlias = double;
typedef BoolAlias = bool;
typedef StringAlias = String;

void fooInt(int arg) {}
void fooNum(num arg) {}
void fooDouble(double arg) {}
void fooBool(bool arg) {}
void fooString(String arg) {}

main() {
  IntAlias i = 1;
  NumAlias n = 3.14;
  DoubleAlias d = 3.1415;
  BoolAlias b = true;
  StringAlias s = "Lily was here";

  fooInt(i);
  fooNum(n);
  fooDouble(d);
  fooBool(b);
  fooString(s);
}
