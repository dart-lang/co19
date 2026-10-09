// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The instance variable initialized by the parameter (and declared by it, if
///   the parameter is a field parameter), has the private name `p`.
///
/// @description Check that it is a compile-time error to use a private name of
/// a private named parameter in a redirectee of a redirecting constructor.
/// @author sgrekhov22@gmail.com

class C {
  String _p;

  C({this._p = '_p'});
  C.named({required String v}) : this(_p: v);
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(String _p) {
  ET({this._p = '_p'});
  ET.named({required String v}) : this(_p: v);
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0, e1(p: "one"), e2.named(v: "1");

  final String _p;

  E({this._p = "_p"});
  E.named({required String v}) : this(_p: v);
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
