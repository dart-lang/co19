// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We can omit the type of an optional parameter with a default
/// value, in which case the type is inferred from the default value.
///
/// @description Check that the omitted type of an optional parameter with a
/// default value is inferred from the default value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/static_type_helper.dart';

const anInt = 0;
const aNum = 1 as num;
const aString = "x";
const aBool = false;

class C1([var v = anInt]);

class C2([final v = aNum]);

class C3({var v = aString});

class C4({final v = aBool});

enum E1([final v = anInt]) {
  e0;
}

enum E2({final v = aNum}) {
  e0;
}

main() {
  C1().v.expectStaticType<Exactly<int>>();
  C2().v.expectStaticType<Exactly<num>>();
  C3().v.expectStaticType<Exactly<String>>();
  C4().v.expectStaticType<Exactly<bool>>();
  E1.e0.v.expectStaticType<Exactly<int>>();
  E2.e0.v.expectStaticType<Exactly<num>>();
}
