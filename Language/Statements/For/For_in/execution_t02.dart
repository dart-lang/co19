// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A for statement of the form for (finalConstVarOrType? id in e) s
/// is equivalent to the following code:
///   var n0 = e.iterator;
///   while (n0.moveNext()) {
///     finalConstVarOrType? id = n0.current;
///     s
///   }
/// where n0 is an identifier that does not occur anywhere in the program, except
/// that for purposes of static typechecking, it is checked under the assumption
/// that n0 is declared to be of type T, where T is the static type of e.iterator.
/// @description Checks that a [TypeError] is thrown if the type of e
/// does not implement [Iterable].
/// @author vasya

import '../../../../Utils/expect.dart';

class A {}

void check(var e) {
  Expect.throws(() { for (var id in e); }, (e) => e is TypeError);

  Expect.throws(() { for (dynamic id in e); }, (e) => e is TypeError);

  Expect.throws(() {
     var id;
      for (id in e);
    }, (e) => e is TypeError);
}

main() {
  check(1234567);
  check("string");
  check(true);
  check(new A());
}
