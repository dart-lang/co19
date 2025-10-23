// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The local variable introduced by the parameter, accessible only in the
///   initializer list, still has the private name `p`.
///
/// @description Check that it is a compile-time error to use a corresponding
/// public name `n` in the initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

class C {
  String? _p1;
  String? p2;

  C({this._p1}) : p2 = p1;
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
  C.named({required this._p1}) : p2 = p1;
//                                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET._(String? _p) {
  ET({this._p}) : assert(p != "");
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  ET.named({required this._p}) : assert(p != "");
//                                      ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(p: "0"), e1.named(p: "1");

  final String? _p1;
  final String? p2;

  const E({this._p1}) : p2 = p1;
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  const E.named({required this._p1}) : p2 = p1;
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
  print(E);
}
