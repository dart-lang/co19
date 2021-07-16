// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A check of the form [e != null] or of the form [e is T] where [e]
/// has static type [T?] promotes the type of [e] to [T] in the [true]
/// continuation, and to [Null] in the [false] continuation.
///
/// @description Check that type of [e] is promoted to [Null] in the [false]
/// continuation. Test [e != null] expression. Test type aliases
/// @author sgrekhov@unipro.ru

class A {
  foo() {}
}

typedef AAlias1 = A?;
typedef AAlias2 = AAlias1?;

main() {
  var a1 = new A() as AAlias1;
  if (a1 != null) {
  } else {
    a1.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var a2 = new A() as AAlias2?;

  if (a2 != null) {
  } else {
    a2.foo();
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
