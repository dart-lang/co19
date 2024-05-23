// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything. This means you can have multiple local declarations named `_` in
/// the same namespace without a collision error.
///
/// @description Checks that it is not an error to have a multiple local
/// declarations named `_`. Test patterns.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C {
  int a, b;
  C(this.a, this.b);
}

main() {
  var (_) = (1);
  final (int _) = (2);
  var [_, int _] = [3, 4];
  final {"key1": _, "key2": int _} = {"key1": 5, "key2": 6};
  var (_, int _) = (7, 8);
  var C(a: _, b: int _) = C(9, 10);
}
