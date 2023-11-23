// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a member declaration in an
/// extension type declaration is abstract.
///
/// @description Checks that it is a compile-time error if an extension type
/// declares an abstract member. Test the case when an extension type inherits
/// non-trivial `noSuchMethod()`
/// @author sgrekhov22@gmail.com
/// @issue 53320

// SharedOptions=--enable-experiment=inline-class

class A {
  int x();
  dynamic noSuchMethod(Invocation invocation) => null;
}

extension type ET(A id) implements A {
  int method();
//^
// [analyzer] unspecified
// [cfe] unspecified

  int get getter;
//^
// [analyzer] unspecified
// [cfe] unspecified

  void set setter(int v);
//^
// [analyzer] unspecified
// [cfe] unspecified

  int get getter;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET);
}
