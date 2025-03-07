// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form `--e` is treated as `(e-=1)`.
///
/// @description Checks that evaluation of an expression of the form --e
/// results in invoking operator- on the result of e with the proper argument.
/// @author rodionov

import '../../../Utils/expect.dart';

bool minusInvoked = false;

class A {
  final String? value;

  A(this.value);

  operator -(var other) {
    minusInvoked = true;
    return new A("${value}-${other}");
  }
}

main() {
  var foo = new A("foo");
  Expect.isFalse(minusInvoked);

  Expect.equals("foo-1", (--foo).value);
  Expect.isTrue(minusInvoked);
  Expect.equals("foo-1", foo.value);
}
