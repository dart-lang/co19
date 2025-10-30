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

// SharedOptions=--enable-experiment=private-named-parameters,declaring-constructors

class C1(int p, {var String _p = ""}) {
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  this(int p, {final String _p = "", });
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1 {
  this(int p, {final String _p = ""});
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2 {
  this(int p = 0, {final String _p = ""});
//                              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1(int p, {final String _p = ""}) {
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  e0(1);
}

enum E2 {
  e0(2);

  const this(int? p, {final String _p = ""});
//                                 ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
  print(E1);
  print(E2);
}
