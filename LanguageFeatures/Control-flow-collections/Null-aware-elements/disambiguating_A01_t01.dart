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
/// @description Check that if leaf elements has at least one
/// `nullAwareExpressionElement` and no `mapEntry` or
/// `nullAwareMapEntry` elements, then `e` is a set literal
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  String? v = 2 > 1 ? "val" : null;

  var s1 = {
    ?v
  };
  Expect.isTrue(s1 is Set);
}
