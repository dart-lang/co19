// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference and promotion flows through records in much the 
/// same way it does for instances of generic classes (which are covariant in 
/// Dart just like record fields are) and collection literals.
///
/// @description Checks type promotion for records. Test records with named and
/// positional fields
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (int i, {String s})?;
typedef R2 = (num?, {Object? o});

main() {
  R1 r1;
  if (2 > 1) {
    r1 = (42, s: "answer");
  }
  if (r1 != null) {
    r1.$1;
    r1.s;
  } else {
    r1?.$1;
    r1?.s;
  }

  R2 r2 = (42, o: "answer");
  if (r2 is (int? n, {String o})) {
    r2.$1?.isOdd;
    r2.o.substring(0);
  }

  (List<Object?>, {Object o}) r3 = ([42], o: 42);
  if (r3 is (List<num>, {int o})) {
    r3.$1[0].sign;
    r3.o.isOdd;
  }

  (int, {String s})? r4 = null;
  if (2 > 1) {
    r4 = (0, s: "s");
  }
  if (r4 != null) {
    r4.$1.isOdd;
    r4.s.substring(0);
  }

  Record r5 = (3.13, i: 0);
  if (r5 is (num, {int i})) {
    r5.$1.sign;
    r5.i.isOdd;
  }
}
