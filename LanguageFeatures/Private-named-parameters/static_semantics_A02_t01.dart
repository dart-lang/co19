// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// - If `p` has no corresponding public name `n`, then compile-time error. You
///   can't use a private name for a named parameter unless there is a valid
///   public name that could be used at the call site.
/// - If any other parameter in `C` has declared name `p` or `n`, then
///   compile-time error.
///
/// @description Check that it is a compile-time error if any other parameter in
/// `C` has declared name `p` or `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

class C {
  String _p;
  String p;
  C({this._p = "", int? _p}) : p = "";
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified

  C._({required this._p, this.p});
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(String _p) {
  ET({this._p = "", int _p = 0});
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.named({required this._p, int? p});
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  final String _p;
  final int? p;
  const E({this._p = "", int? _p});
//                            ^^
// [analyzer] unspecified
// [cfe] unspecified

  const E.named({required this._p, this.p});
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
  print(E);
}
