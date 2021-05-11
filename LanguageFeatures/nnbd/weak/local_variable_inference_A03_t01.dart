// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  In the case that the type of the initializer is a promoted type
/// variable X & T, the inferred type of the variable shall be X, but X & T shall
/// be considered as a type of interest and the initialization treated as an
/// assignment for the purposes of promotion. Consequently, such a variable shall
/// be treated as immediately promoted to X & T
///
/// @description Checks that if the type of initializer is X&T then the variable
/// is treated as X & T
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

test<T extends num>(T t) {
  if (t is int) {
    var x = t;
    x.isEven;
  }
  if (t is double) {
    var x = t;
    x.round();
  }
}

main() {
  test<int>(42);
}
