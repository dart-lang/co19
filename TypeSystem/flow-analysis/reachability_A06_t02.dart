// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Null check operator: If N is an expression of the form E!, then:
///  Let before(E) = before(N)
///  Let null(N) = unreachable(null(E))
///  Let nonNull(N) = nonNull(E)
///
/// @description Checks reachability after Null check operator
/// @author sgrekhov@unipro.ru
/// @issue 42021

// @dart = 3.7.0

main () {
  int i;
  var s = "" as String?;
  if (s! != null) {
    i = 42;   // `i` is not definitely unassigned because in a weak mode a value
              // of a non-nullable expression is considered to be possibly null
  }
  i; // It is an error to read a local non-nullable variable which is not definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
