// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Otherwise, the body of f is executed with this bound to o. The
/// value of i is the result returned by the call to the getter function.
///
/// @description Checks that it is a compile-time error if the getter in the
/// superclass is called with `this` bound to the current value of `this`,
/// and the result is the result of `super.m`.
/// @author ilya
/// @author sgrekhov@unipro.ru

class A {
  get field => this.x + 1;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C extends A {
  var x;
  C(this.x);
  test() => super.field;
}

main() {
  print(C);
}
