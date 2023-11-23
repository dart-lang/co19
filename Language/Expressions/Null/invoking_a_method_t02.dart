// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The [Null] class extends the [Object] class and declares no
/// methods except those also declared by [Object].
/// @description Checks that invoking a method on [null] yields error if class
/// [Null] does not explicitly implement it.
/// @author hlodvig

import '../../../Utils/expect.dart';

class A {
  void aMethodWithAFancyName() {}
}

dynamic getNull() => null;

main() {
  Expect.throws(() {
      A a = getNull();
      a.aMethodWithAFancyName();
    });
}
