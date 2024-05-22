// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is currently an error for a record field name to begin with
/// `_` (including just a bare `_`). We relax that error to only apply to record
/// fields whose name begins with `_` followed by at least one other character
/// (even if those later character(s) are `_`).
///
/// @description Checks that it is not an error to declare record type with an
/// underscore as an optional name of a positional field.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

typedef R1 = (int _, {String s});
typedef R2 = (int _, int _);
typedef (int _,) R3();
typedef (int _, int _) R4();
typedef void R5((String _, {String s}) r);
typedef void R6((String _, int _) r);

(int _,) r3() => (42,);
(int _, int _) r4() => (1, 2);

void r5((String _, {String s}) r) {
  Expect.equals("1", r.$1);
}

void r6((String _, int _) r) {
  Expect.equals("1", r.$1);
  Expect.equals(2, r.$2);
}

const (int _,) r7 = (7,);

main() {
  (int _, String _) r0 = (42, "2");
  Expect.equals(42, r0.$1);
  Expect.equals("2", r0.$2);

  R1 r1 = (1, s: "");
  Expect.equals(1, r1.$1);

  R2 r2 = (1, 2);
  Expect.equals(1, r2.$1);
  Expect.equals(2, r2.$2);

  R3 f3 = r3;
  Expect.equals(42, f3().$1);

  R4 f4 = r4;
  Expect.equals(1, f4().$1);
  Expect.equals(2, f4().$2);

  R5 f5 = r5;
  f5(("1", s: "s"));

  R6 f6 = r6;
  f6(("1", 2));

  Expect.equals(7, r7.$1);

  dynamic d = (3.14, s: "pi");
  if (d is (num _, {String s})) {
    print(d);
  }
  d as (double _, {String s});
}
