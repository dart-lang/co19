// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference and promotion flows through records in much the 
/// same way it does for instances of generic classes (which are covariant in 
/// Dart just like record fields are) and collection literals.
///
/// @description Checks type promotion for records. Test records with positional
/// fields only
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

typedef R1 = (int, String)?;
typedef R2 = (num, Object);

main() {
  R1 r1;
  if (2 > 1) {
    r1 = (42, "answer");
  }
  if (r1 != null) {
    r1.$0;
    r1.$1;
  } else {
    r1?.$0;
    r1?.$1;
  }

  R2 r2 = (42, "answer");
  if (r2 is (int, String)) {
    r2.$0.isOdd;
    r2.$1.substring(0);
  }

  (Object,) r3 = (42,);
  if (r3 is (int,)) {
    r3.$0.isOdd;
  }

  (String,)? r4 = null;
  if (2 > 1) {
    r4 = ("Lily was here",);
  }
  if (r4 != null) {
    r4.$0.substring(0);
  }

  Record r5 = (1, 2);
  if (r5 is (int, int)) {
    r5.$0.isOdd;
    r5.$1.isOdd;
  }
}
