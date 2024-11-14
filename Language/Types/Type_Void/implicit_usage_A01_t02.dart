// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, we need to address situations involving implicit usage
/// of an object whose static type can be `void`. It is a compile-time error for
/// a for-in statement to have an iterator expression of type `T` such that
/// `Iterator<void>` is the most specific instantiation of `Iterator` that is a
/// superinterface of `T`, unless the iteration variable has type `void`.
///
/// @description Checks that it is not an error if in a for-in loop type of the
/// iterator expression is `Iterator<void>` and the type of the iteration
/// variable is `void`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

void main() {
  List<void> list = <void>[1, 2, 3];
  int j = 0;
  for (void i in list) {
    Expect.equals(++j, i as int);
  }
  j = 0;
  for (var i in list) {
    Expect.equals(++j, i as int);
  }
}
