// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the name of a named optional
/// parameter begins with an `_` character.
///
/// @description Checks that there is no compile-time error to call a function
/// with the name of a named optional parameter starting with `_`.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  noSuchMethod(Invocation invocation) {
    final namedArgs = invocation.namedArguments;
    final name = Symbol('name');
    if (namedArgs.keys.contains(name)) {
      final paramName = Symbol(namedArgs[name]);
      if (namedArgs.keys.contains(paramName)) {
        return namedArgs[paramName];
      }
    }
  }
}

main() {
  dynamic c = C();
  Expect.equals(1, c.whatever(name: '_', _: 1));
  Expect.equals(2, c.whatever(name: '_p', _p: 2));
}
