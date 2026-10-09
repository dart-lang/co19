// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory declares a formal parameter list which must
/// correspond to the formal parameter list of the redirectee.
/// ...
/// With this feature, the treatment of named parameters is modified:
/// A private named parameter `p` in the redirectee corresponds to
// a named parameter `p1` in the redirecting constructor whose name
// is the corresponding public name of the name in `p`.
///
/// @description Check that it is a compile-time error if a redirectee of a
/// factory redirecting constructor uses a private name of a private named
/// parameter.
/// @author sgrekhov22@gmail.com

class A {
  factory({int _p}) = B;
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class B({final int _p = 0}) implements A;

class C {
  String _p;

  C._({this._p = '_p'});
  factory({required String _p}) = C._;
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(String _p) {
  ET({this._p = '_p'});
  factory named({String _p}) = ET.new;
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(B);
  print(C);
  print(ET);
}
