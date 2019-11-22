/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks initialization of type aliases for built-in types via
 * literals
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;
typedef NumAlias = num;
typedef DoubleAlias = double;
typedef BoolAlias = bool;
typedef StringAlias = String;

main() {
  IntAlias i = 1;
  NumAlias n = 3.14;
  DoubleAlias d = 3.1415;
  BoolAlias b = true;
  StringAlias s = "Lily was here";

  Expect.equals(1, i);
  Expect.equals(3.14, n);
  Expect.equals(3.1415, d);
  Expect.isTrue(b);
  Expect.equals("Lily was here", s);

  i = 3;
  n = 1;
  d = 4;
  b = false;
  s = "Run, Forrest, Run!";

  Expect.equals(3, i);
  Expect.equals(1, n);
  Expect.equals(4, d);
  Expect.isFalse(b);
  Expect.equals("Run, Forrest, Run!", s);
}
