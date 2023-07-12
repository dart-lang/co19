// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let Ssuper be the superclass of the immediately enclosing class
/// for i, and let L be the library that contains i. Let the declaration D be
/// the result of looking up the method m in Ssuper with respect to L, and let F
/// be the static type of D. Otherwise, if the method lookup failed, let the
/// declaration D be the result of looking up the getter m with respect to L in
/// Ssuper, and let F be the return type of D. If both lookups failed, a
/// compile-time error occurs
///
/// @description Checks that it is not an error if loockup for an instance
/// member named `m` successes. Test an external member (with no body but not an
/// abstract)
/// @author sgrekhov22@gmail.com

abstract class A {
  external void m();
  external int g;
  external void set s(int i);
}

class C extends A {
  void n() {
    super.m();
    super.g;
    super.s = 0;
  }
}

main() {
  print(C);
}
