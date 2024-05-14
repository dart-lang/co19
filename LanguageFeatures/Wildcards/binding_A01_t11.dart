// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that constructor tear-offs with wildcarded parameters
/// can be invoked
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C {
  C(_);
  C.constructor([int _ = 1]);
  const C.constantConstructor(_);
  factory C.factoryConstructor(_) => C(0);
  C.redirecting(_) : this(1);
}

enum E {
  e0(0),
  e1.constructor(1);

  const E(_);
  const E.constructor([int _ = 1]);
}

extension type ET(int id) {
  ET.constructor(this.id, [int _ = 1]);
  const ET.constantConstructor(this.id, _);
  factory ET.factoryConstructor(_) => ET(0);
  ET.redirecting(_) : this(1);
}

main() {
  var to1 = C.new;
  to1(42);

  var to2 = C.constructor;
  to2(42);

  var to3 = C.constantConstructor;
  to3(42);

  var to4 = C.factoryConstructor;
  to4(42);

  var to5 = C.redirecting;
  to5(42);

  var to6 = ET.new;
  to6(42);

  var to7 = ET.constantConstructor;
  to7(0, 42);

  var to8 = ET.factoryConstructor;
  to8(42);

  var to9 = ET.redirecting;
  to9(42);
}
