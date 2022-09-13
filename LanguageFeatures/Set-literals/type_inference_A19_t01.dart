// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion To infer the type of element:
/// ...
/// If element is a spreadElement with expression e1:
/// ...
/// If P is Map<Pk, Pv> then let S be the inferred type of e1 in context P:
/// ...
/// Otherwise it is an error.
///
/// @description Checks that otherwise it is an error
/// @author sgrekhov@unipro.ru

main() {
  String? s = "Let it be";
  var x1 = <int, String>{...s};
//                          ^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
// [cfe] Unexpected type 'String' of a map spread entry.  Expected 'dynamic' or a Map.
  var x2 = <int, String>{...?s};
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}
