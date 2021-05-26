// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a super method invocation occurs in
/// a top-level function or variable initializer, in an instance variable
/// initializer or initializer list, in class Object, in a factory constructor
/// or in a static method or variable initializer.
/// @description Checks that it is a compile-time error if a super method
/// invocation occurs in an instance variable initializer.
/// @author msyabro
/// @reviewer kaigorodov


class S {
  f() {}
}

class A extends S {
  A(): super(), x = super.f();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
  var x;
}

main() {
  try {
    new A();
  } catch (e) {}
}
