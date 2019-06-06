/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Test for type aliases for built-in types
 * @description Checks initialization via constructor
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import '../../../Utils/expect.dart';

typedef IntAlias = int;
typedef NumAlias = num;
typedef DoubleAlias = double;
typedef BoolAlias = bool;
typedef StringAlias = String;

class A {
  int i;
  num n;
  double d;
  bool b;
  String s;

  A(this.i, this.n, this.d, this.b, this.s);
}

class C extends A {
  C(IntAlias ia, NumAlias na, DoubleAlias da, BoolAlias ba, StringAlias sa) :
        super(ia, na, da, ba, sa);
}

main() {
  IntAlias i = 1;
  NumAlias n = 3.14;
  DoubleAlias d = 3.1415;
  BoolAlias b = true;
  StringAlias s = "Lily was here";

  C c = new C(i, n, d, b, s);

  Expect.equals(1, c.i);
  Expect.equals(3.14, c.n);
  Expect.equals(3.1415, c.d);
  Expect.isTrue(c.b);
  Expect.equals("Lily was here", c.s);
}
