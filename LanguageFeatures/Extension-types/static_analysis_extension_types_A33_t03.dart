// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V is always-exhaustive if and only if its
/// instantiated representation type is always-exhaustive.
///
/// @description Check that an extension type is always-exhaustive if its
/// representation type is always-exhaustive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

sealed class A {}

class B extends A {}

extension type BET(B _) {}

String test1(BET b) {
  switch (b) {
    case B _: return 'B';
  }
}

String test2(BET b) => switch (b) {
    B _ => 'B'
  };

String test3(A a) {
  switch (a) {
    case BET _: return 'BET';
  }
}

String test4(A a) => switch (a) {
    BET _ => 'BET'
  };

main() {
  Expect.equals('B', test1(BET(B())));
  Expect.equals('B', test2(BET(B())));
  Expect.equals('BET', test3(B()));
  Expect.equals('BET', test4(B()));
}
