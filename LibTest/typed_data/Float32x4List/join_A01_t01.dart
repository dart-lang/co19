// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that the returned [String] contains all elements from
/// this separated by `separator`.
/// @author msyabro
/// @issue 43267

import "dart:typed_data";

import "../typed_data_lib.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

main() {
  check(Float32x4List.fromList([]), "");
  check(Float32x4List.fromList([]), ", ");
  check<Float32x4>(Float32x4List.fromList([pack(1.25)]), ", ");
  check(
    Float32x4List.fromList([
      pack(1.25),
      pack(2.25),
      pack(3.25),
      pack(4.25),
      pack(5.25),
      pack(6.25),
      pack(7.25),
      pack(8.25),
      pack(9.25),
    ]),
    "  ",
  );
}
