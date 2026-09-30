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
/// @description Checks that if `separator` is omitted, the default separator
/// `""` is used.
/// @author ngl@unipro.ru

import "dart:typed_data";

import "../typed_data_lib.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

main() {
  check<Float64x2>(Float64x2List.fromList([]));
  check<Float64x2>(Float64x2List.fromList([f64x2(1.123456)]));
  check<Float64x2>(Float64x2List.fromList([
    f64x2(1.123456),
    f64x2(2.123456),
    f64x2(3.123456),
    f64x2(4.123456),
    f64x2(5.123456),
  ]));
}
