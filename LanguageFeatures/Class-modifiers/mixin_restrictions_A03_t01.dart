// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a mixin class declaration:
/// ...
/// - declares any non-trivial generative constructor
/// A trivial generative constructor is a generative constructor that:
/// - Is not a redirecting constructor _(Foo(...) : this.other(...);),
/// - declares no parameters (parameter list is precisely ()),
/// - has no initializer list (no : ... part, so no asserts or initializers, and
///   no explicit super constructor invocation),
/// - has no body (only ;), and
/// - is not external.
///
/// @description Check that it is a compile-time error if a `mixin class`
/// declares a non-trivial generative constructor
/// @author sgrekhov22@gmail.com

mixin class M1 {
  M1(int x);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M2 {
  int x;
  M2(this.x);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M3 {
  M3() {}
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M4 {
  int x;
  M4() : x = 0;
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M5 {
  M5() : assert(true);
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M6 {
  M6() : super();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M7 {
  M7.named();
  M7() : this.named();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M8 {
  external M8();
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(M1);
  print(M2);
  print(M3);
  print(M4);
  print(M5);
  print(M6);
  print(M7);
  print(M8);
}
