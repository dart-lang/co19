// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Execution of a variable declaration statement of one of the forms
/// var v = e; T v = e; const v = e; const T v = e; final v = e; or
/// final T v = e; proceeds as follows:
/// The expression e is evaluated to an object o. A dynamic type error occurs if
/// the dynamic type of o is not a subtype of the actual declared type of v.
/// Otherwise, the variable v is bound to o.
///
/// @description Checks that a variable declaration statement `T id = e;` indeed
/// results in a variable `id` being assigned the value of `e`, whether or not
/// it's final.
/// @author vasya

import '../../../Utils/expect.dart';

main() {
  var v;

  bool id = false;
  v = false;
  Expect.isTrue(id == v);

  final int id1 = 11;
  v = 11;
  Expect.isTrue(id1 == v);

  final String id2 = "id2";
  v =  "id2";
  Expect.isTrue(id2 == v);

  Object? id3 = null;
  v =  null;
  Expect.isTrue(id3 == v);
}
