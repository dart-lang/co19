// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile-time error to derive a mixin from a class that
/// declares a generative constructor, or from a class that has a superclass
/// other than Object.
///
/// @description Check that it is a compile-time error to derive a mixin from a
/// class which has a superclass other than `Object`.
/// @issue 26409
/// @issue 27531
/// @issue 42254
/// @author sgrekhov@unipro.ru

class Sstatic {
}

mixin class M extends Sstatic {
//                    ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class SuperA {
}

class A = SuperA with M;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}
