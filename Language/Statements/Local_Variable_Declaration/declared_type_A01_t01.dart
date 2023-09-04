// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The declared type of a local variable with a declaration of one
/// of the forms
/// late? T v = e; late? final T v = e; const T v = e; is T
///
/// @description Checks that the declared type of a local variable with the
/// specified type `T` is `T`
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

main() {
  // We use `as dynamic` below to avoid a type promotion on an assignment
  late num v1 = 1 as dynamic;
  late final num v2 = 2 as dynamic;
  num v3 = 3 as dynamic;
  final num? v4 = 4 as dynamic;
  const num v5 = 5 as dynamic;

  v1.expectStaticType<Exactly<num>>();
  v2.expectStaticType<Exactly<num>>();
  v3.expectStaticType<Exactly<num>>();
  v4.expectStaticType<Exactly<num?>>();
  v5.expectStaticType<Exactly<num>>();
}
