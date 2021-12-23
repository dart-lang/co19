// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, we define inference on a setOrMapLiteral collection as
/// follows:
/// ...
/// Otherwise, collection is still ambiguous, the downwards context for the
/// elements of collection is ?, and the disambiguation is done using the
/// immediate elements of collection as follows:
/// ...
/// Otherwise, the literal cannot be disambiguated and it is a compile-time error.
///
/// @description Checks that if collection is still ambiguous it is a
/// compile-time error
/// @author sgrekhov@unipro.ru

class C<T> {
  test(T t) {
    var v = {...t};
//          ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  var iterable = [1, 2];
  var map = {1: 2};
  var ambiguous1 = {...iterable, ...map};
  //               ^^^^^^^^^^^^^^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_BOTH
  // [cfe] Both Iterable and Map spread elements encountered in ambiguous literal.

  dynamic dyn;
  var ambiguous2 = {...dyn};
  //               ^^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.AMBIGUOUS_SET_OR_MAP_LITERAL_EITHER
  // [cfe] Not enough type information to disambiguate between literal set and literal map.
}
