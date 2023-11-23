// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If more than one super-constraint interface declares a member
/// with the same name, at least one of those members is more specific than the
/// rest,  and this is the unique signature that super-invocations are allowed
/// to invoke.
///
/// @description Checks that if more than one super-constraint interface declares
/// a member with the same name and there is no member that is more specific
/// than the rest, then this is a compile error
/// @author sgrekhov@unipro.ru

class I {}
class J {}

class B {
  String get b1 => "B";
}
class C {
  double get b1 => 3.14;
}

mixin M on B, C implements I, J {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class A implements B, C {
  double get b1 => -3.14;
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class MA extends A with M {
//    ^
// [cfe] unspecified
}

main() {
  new MA();
}
