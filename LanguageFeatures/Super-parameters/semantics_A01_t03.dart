// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a super-parameter in any declaration
/// other than a non-redirecting generative constructor.
///
/// All non-redirecting generative constructors have a super-constructor
/// invocation at the end of their initializer list. If none is written (or
/// there is even no initializer list), the default is an invocation of super(),
/// targeting the unnamed superclass constructor. It’s a compiler-time error if
/// the superclass does not have the specified constructor, or it’s not a
/// generative constructor.
///
/// @description Check that it is a compile-time error if a super-parameter in
/// any declaration other than a non-redirecting generative constructor
/// @author sgrekhov@unipro.ru

class S {
  int s1 = 0;
}

class C extends S {
  int i;
  C(this.i, super.s1);

  factory C.f(int i, super.s1) => new C(i, 42);
//                   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C(42);
}
