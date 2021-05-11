// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Variable or getter: If N is an expression of the form x where the
/// type of x is T then:
///
/// If T <: Never then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = unreachable(before(N)).
/// Otherwise if T <: Null then:
///  Let null(N) = before(N).
///  Let notNull(N) = unreachable(before(N)).
/// Otherwise if T is non-nullable then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = before(N).
///
/// @description Checks reachability after variable or getter. Test getter of
/// type Null
///
/// @author sgrekhov@unipro.ru
/// @issue 41981


Null get n => null;

main() {
  late int i;
  if (n != null) {
    i = 42; // Variable is initialized in a dead code. This leaves it definitely unassigned
  }
  i; // It is an error to read a local late variable when it is definitely unassigned.
//^
// [analyzer] unspecified
// [cfe] unspecified
}
