// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String join([String separator = ""])
///
/// Converts each element to a [String] and concatenates the strings.
///
/// Iterates through elements of this iterable, converts each one to a [String]
/// by calling [Object.toString], and then concatenates the strings, with the
/// `separator` string interleaved between the elements.
///
/// @description Checks that the returned [String] contains all elements of this
/// list separated by `separator`.
/// @author ngl@unipro.ru

import "dart:typed_data";

import "../typed_data_lib.dart";

Int32x4 i32x4(n) => new Int32x4(n, n, n, n);

main() {
  check<Int32x4>(Int32x4List.fromList([]), "");
  check<Int32x4>(Int32x4List.fromList([]), ", ");
  check<Int32x4>(
    Int32x4List.fromList([i32x4(0), i32x4(1), i32x4(2), i32x4(3)]),
    ", ",
  );
}
