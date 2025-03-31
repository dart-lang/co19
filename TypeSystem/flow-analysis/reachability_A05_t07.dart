// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion other literal: If `N` is some other literal than the above, then:
/// - Let `after(N) = before(N)`.
///
/// @description Checks that a string literal is always non-nullable.
/// @author sgrekhov@unipro.ru
/// @issue 41985
/// @issue 60114

// SharedOptions=--enable-experiment=sound-flow-analysis

main() {
  late int i;
  if ("Lily was here" == null) { // ignore: unnecessary_null_comparison
    i = 42;
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
