// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let k be a generative constructor.
/// Each final instance variable f declared in the immediately enclosing class
/// must have an initializer in k's initializer list unless it has already been
/// initialized by one of the following means:
///  - Initialization at the declaration of f.
///  - Initialization by means of an initializing formal of k.
/// or a compile-time error occurs.
/// @description Checks that it is a compile error if a final variable is not
/// initialized in one of the specified ways.
/// @author vasya
/// @author sgrekhov@unipro.ru


class C {
  C() {}
//^
// [analyzer] unspecified

  final _val;
//      ^^^^
// [cfe] unspecified
}

main() {
  new C();
}
