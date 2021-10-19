// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is no error to derive a mixin from a class which has a
/// superclass other than Object.
/// @description Checks that it is a compile error to derive a mixin from a class
/// which has a superclass other than Object.
/// @issue 26409
/// @issue 42254
/// @author sgrekhov@unipro.ru


class Sstatic {
}

class M extends Sstatic {
}

class SuperA extends Sstatic {
}

class A = SuperA with M;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}
