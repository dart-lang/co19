// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When disambiguating map and set literals, we replace the existing
/// "If leaf elements is not empty" step with:
/// Else, if leaf elements is not empty, then:
/// - If leaf elements has at least one `expressionElement` or
///   `nullAwareExpressionElement` and no `mapEntry` or `nullAwareMapEntry`
///   elements, then `e` is a set literal with unknown static type. The static
///   type will be filled in by type inference, defined below.
/// - If leaf elements has at least one `mapEntry` or `nullAwareMapEntry` and no
///   `expressionElement` or `nullAwareExpressionElement` elements, then `e` is
///   a map literal with unknown static type. The static type will be filled in
///   by type inference, defined below.
/// - If leaf elements has at least one `mapEntry` or `nullAwareMapEntry` and at
///   least one `expressionElement` or `nullAwareExpressionElement`, report a
///   compile-time error.
///
/// @description Check that if the set of leaf elements has at least one
/// `nullAwareMapEntry` and no `expressionElement` or
/// `nullAwareExpressionElement` elements, then `e` is a map literal
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  String? key = null, v = null;
  if (2 > 1) {
    v = "val";
    key = "key";
  }

  var m1 = {
    ?key: v
  };
  Expect.isTrue(m1 is Map);
  var m2 = {
    ?key: ?v
  };
  Expect.isTrue(m2 is Map);
  var m3 = {
    key: ?v
  };
  Expect.isTrue(m3 is Map);
}
