// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement s of the form return e?;
/// ...
/// It is a compile-time error if s is
///  return;, unless T is void, dynamic, or Null
///
/// @description Checks that there's no error when a statement of the form
/// "return;" is used in a method that returns type dynamic, or a constructor.
///
/// @author rodionov


abstract class I {
  factory I() { return new C(); }
}

class C implements I {
  C() { return; }
  static sm() { return; }
  get g { return; }
  foo() { return; }
}

main() {
  dynamic x = new C();
  x = C.sm();
  x = new C().foo();
  x = new C().g;
  x = new I();
}
