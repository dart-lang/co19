// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion These grammar changes allows type parameters without following
/// parenthesized arguments in places where we previously did not allow them.
/// For example, this means that <typeArguments> becomes a selector by itself,
/// not just followed by arguments.
///
/// It applies to instance methods as well as local, static and top-level
/// function declarations. For instance methods, it applies to references of the
/// form
///
/// instanceMethod<int> (with implicit this),
/// object.instanceMethod<int> (including this) and super.instanceMethod<int>.
///
/// @description Checks tear-off of inherited generic instance method including
/// 'super'
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class A {
  String log = "";
  T instanceMethod<T>(T t) {
    log = "A";
    return t;
  }
}

class C extends A {
  var x1;
  var x2;
  C() {
    x1 = super.instanceMethod<int>;
    x2 = this.instanceMethod<int>;
  }
  T instanceMethod<T>(T t) {
    log = "C";
    return t;
  }
}

main() {
  C c = new C();
  Expect.equals(42, c.x1(42));
  Expect.equals("A", c.log);
  Expect.equals(-42, c.x2(-42));
  Expect.equals("C", c.log);
}
