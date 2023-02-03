// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// The context type schema for a pattern p is:
/// ...
/// Null-assert: A context type schema E? where E is the context type schema of
/// the inner pattern
///
/// @description Check that the context type schema for null-asser pattern is a
/// context type schema E? where E is the context type schema of the inner
/// pattern
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/static_type_helper.dart";

main() {
  var (v1!) = 42 as num?;
  v1.expectStaticType<Exactly<num>>();
  final (v2!) = 42 as num?;
  v2.expectStaticType<Exactly<A>>();
}
