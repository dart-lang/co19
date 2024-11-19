// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If both the extension and the method is generic, then inference
/// must infer the extension type parameters first, to figure out whether the
/// extension applies, and only then start inferring method type parameters. As
/// mentioned above, the inference is similar to other cases of chained
/// inference.
///
/// @description Check that two-step type inference forces correct type
/// parameter choice and error is reported if method parameter is of incorrect
/// type.
/// @author iarkh@unipro.ru

extension SuperList<T> on List<T> {
  void checkme1<R>(R i) {}
  void checkme2<R extends T>(R i) {}
}

main() {
  List<String> list = [];
  list.checkme1(42);
  list.checkme1<int>(42);
  list.checkme2(42);
//     ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  list.checkme2<int>(42);
//              ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
