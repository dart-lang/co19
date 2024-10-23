// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Note that it is still possible for the instantiated
/// representation type of a given extension type to be a bottom type. For
/// example, assuming extension type `E<X>(X x) {}, E<Never>` would be an
/// extension type whose instantiated representation type is `Never`.
///
/// @description Check that it is not an error to have an instantiated
/// representation type to be a bottom type.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

typedef NeverAlias = Never;

extension type ET<X>(X _) {}

main() {
  ET<Never>? et1;
  et1.expectStaticType<Exactly<ET<Never>?>>();
  ET<NeverAlias>? et2;
  et2.expectStaticType<Exactly<ET<Never>?>>();
}
