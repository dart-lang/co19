// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a static warning if a class has a setter named v= with
/// argument type T and a getter named v with return type S, and S may not be
/// assigned to T
/// @description Checks that it isnot an error if class defines a setter named
/// `foo=` and a getter named `foo` with argument/return types that are not
/// mutually assignable. Types in getter/setter signatures provided explicitly
/// (`String` and `double`).
/// @author iefremov
/// @issue 42179
/// @issue 42702

class C {
  set foo(double d) {}

  String get foo => "";
}

main() {
  C().foo = 42;
}
