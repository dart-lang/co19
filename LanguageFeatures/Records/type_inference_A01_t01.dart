// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference and promotion flows through records in much the 
/// same way it does for instances of generic classes (which are covariant in 
/// Dart just like record fields are) and collection literals.
///
/// @description Checks type inference for records. Test records with positional
/// fields only
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/static_type_helper.dart";

main() {
  var r1 = (42, "");
  r1.expectStaticType<Exactly<(int, String)>>();

  final r2 = (null, 3.14);
  r2.expectStaticType<Exactly<(Null, double)>>();
}
