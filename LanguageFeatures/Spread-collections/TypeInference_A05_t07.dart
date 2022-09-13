// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collections Spec:
/// We require that at least one component unambiguously determine the literal
/// form, otherwise it is a compile-time error. So, given:
///    dynamic x = <int, int>{};
///    Iterable l = [];
///    Map m = {};
///    Then:
///    {...x}       // Static error, because it is ambiguous.
///    {...x, ...l} // Statically a set, runtime error when spreading x.
///    {...x, ...m} // Statically a map, no runtime error.
///    {...l, ...m} // Static error, because it must be both a set and a map.
/// @description Checks that {...l, ...m} is a static error
/// @author iarkh@unipro.ru


main() {
  Iterable l = [];
  Map m = {};
  var res1   = {...l, ...m};
//             ^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  var res2   = {...m, ...l};
//             ^^^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
  List res3  = {...l, ...m};
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  Map res4   = {...l, ...m};
//             ^
// [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.
//                 ^
// [analyzer] COMPILE_TIME_ERROR.NOT_MAP_SPREAD
}
