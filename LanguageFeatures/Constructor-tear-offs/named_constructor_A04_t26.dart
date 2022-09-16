// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, [params] is almost exactly the same parameter list
/// as the constructor [C.name], with the one exception that initializing
/// formals are represented by normal parameters with the same name and type.
/// All remaining properties of the parameters are the same as for the
/// corresponding constructor parameter, including any default values, and
/// [args] is an argument list passing those parameters to [C.name] directly as
/// they are received.
///
/// @description Checks that [params] is exactly the same parameter list
/// @author sgrekhov@unipro.ru

class C {
  int x;
  String s;
  C(this.x, this.s);
  factory C.f1(int x) = D.new;
//                      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class D extends C {
  D() : super(42, "Lily was here");
}

main() {
  new C.f1(42);
}
