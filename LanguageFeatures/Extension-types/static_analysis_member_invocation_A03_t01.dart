// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with the
/// actual type arguments T1, ..., Ts.
/// ...
/// V has an extension type member m with a uniquely determined declaration Dm
/// ...
/// If Dm is a getter declaration with return type R then the static type of the
/// invocation is R
///
/// @description Checks static type of a getter of an extension type
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

extension type ET1(num id) {
  int get asInt => id.toInt();
}

extension type ET2<T extends num>(T id) {
  double get asDouble => id.toDouble();
}

main() {
  ET1 et1 = ET1(42);
  et1.asInt.expectStaticType<Exactly<int>>();
  et1.id.expectStaticType<Exactly<num>>();

  ET2<num> et2 = ET2<double>(3.14);
  et2.asDouble.expectStaticType<Exactly<double>>();
  et2.id.expectStaticType<Exactly<num>>();

  ET2<double> et3 = ET2(3.14);
  et3.asDouble.expectStaticType<Exactly<double>>();
  et3.id.expectStaticType<Exactly<double>>();
}
