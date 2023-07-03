// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An instance field is promotable only if
/// (a) it is private,
/// (b) it is final, and
/// (c) all other concrete instance getters with the same name in the same
/// library are also final fields
///
/// @description Checks that an instance field is promotable even if it is late
/// @author sgrekhov22@gmail.com
/// @issue 50949

// SharedOptions=--enable-experiment=inference-update-2

class C {
  late final int? _x;

  void test() {
    _x = 42;
    _x.isOdd;
  }
}

main() {
  C().test();
}
