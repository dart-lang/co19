/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Conditional expressions inside of braces are ambiguous between
 * sets and maps. That is, { a as bool ? - 3 : 3 } can be parsed as a set
 * literal { (a as bool) ? - 3 : 3 } or as a map literal
 * { (a as bool ?) - 3 : 3 }. Parsers will prefer the former parse over the
 * latter.
 *
 * The same is true for { a is int ? - 3 : 3 }.
 *
 * The same is true for { int ? - 3 : 3 } if we allow this.
 *
 * @description Check that { a as bool ? - 3 : 3 } is parsed as
 * { (a as bool) ? - 3 : 3 }
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

main() {
  dynamic a = true;
  var v = { a as bool ? - 3 : 3 };
  Expect.setEquals({-3}, v);

  dynamic a2 = false;
  var v2 = { a2 as bool ? - 3 : 3 };
  Expect.setEquals({3}, v2);

  var a3 = 42;
  var v3 = { a3 is int ? - 3 : 3 };
  Expect.setEquals({-3}, v3);

  dynamic a4 = 3.14;
  var v4 = { a4 is int ? - 3 : 3 };
  Expect.setEquals({3}, v4);

}
