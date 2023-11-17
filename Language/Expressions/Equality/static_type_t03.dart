// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of an equality expression is bool.
///
/// @description Checks that it is a compile-time error to assign the result of
/// `==` operator call to a variable which static type is not bool
/// @author sgrekhov22@gmail.com
/// @issue 54080

// SharedOptions=--enable-experiment=inline-class

class C {
  BoolET operator ==(Object? other) {
    return BoolET(other == this);
  }
}

extension type BoolET(bool b) implements bool {}

main() {
  BoolET b = C() == C();
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
