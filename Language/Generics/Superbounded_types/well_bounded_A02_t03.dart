// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error to call a generic function with
/// a well-bounded type parameter
/// @author iarkh@unipro.ru

void testme<X extends num>() {}

main() {
  testme();
  testme<num>();
  testme<int>();
}
