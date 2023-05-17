// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If Dm is a getter declaration with return type R then the static
/// type of the invocation is [T1/X1 .. Ts/Xs]R.
///
/// @description Checks static type of a getter of an `inline` class
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/static_type_helper.dart";

inline class IC1 {
  final num id;
  IC1(this.id);

  int get asInt => id.toInt();
}

inline class IC2<T extends num> {
  final T id;
  IC2(this.id);

  double get asDouble => id.toDouble();
}

main() {
  IC1 ic1 = IC1(42);
  ic1.asInt.expectStaticType<Exactly<int>>();
  ic1.id.expectStaticType<Exactly<num>>();

  IC2<num> ic2 = IC2<double>(3.14);
  ic2.asDouble.expectStaticType<Exactly<double>>();
  ic2.id.expectStaticType<Exactly<num>>();

  IC2<double> ic3 = IC2(3.14);
  ic3.asDouble.expectStaticType<Exactly<double>>();
  ic3.id.expectStaticType<Exactly<double>>();
}
