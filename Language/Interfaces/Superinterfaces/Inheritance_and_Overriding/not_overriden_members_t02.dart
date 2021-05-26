// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion An interface I inherits any members of its superinterfaces that
/// are not overridden by members declared in I.
/// @description Checks that an interface does not inherit static members of
/// its superinterfaces.
/// Expects a compile time error when trying to access a superinterface's static
/// member S via a subinterface, as specified in (Expressions/Getter Invocation)
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

abstract class S {
  static int get foo => 1;
}

abstract class S2 implements S {
  static dynamic get bar => 2;
}

abstract class I implements S2 {
}

main() {
  Expect.throws(() {I.foo;}, (e) => e is NoSuchMethodError);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.throws(() {I.bar;}, (e) => e is NoSuchMethodError);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}
