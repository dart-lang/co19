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
/// @description Check that it is a compile-time error if the set of leaf
/// elements has at least one `nullAwareMapEntry` and at least one
/// `expressionElement` or `nullAwareExpressionElement` elements.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

main() {
  String? key = null, v = null;
  if (2 > 1) {
    v = "val";
    key = "key";
  }
  var c1 = {
    ?key: "nullAwareMapEntry",
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    "expressionElement"
  };
  var c2 = {
    "nullAwareMapEntry": ?v,
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
    "expressionElement"
  };
  var c3 = {
    ?key: ?v,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    "expressionElement"
  };
  var c4 = {
    ?key: "nullAwareMapEntry",
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ?v
  };
  var c5 = {
    "nullAwareMapEntry": ?v,
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
    ?v
  };
  var c6 = {
    ?key: ?v,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ?v
  };

  Iterable l = [];
  var c7 = {
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    ?key: "nullAwareMapEntry",
    ...l
  };
  var c8 = {
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    "nullAwareMapEntry": ?v,
    ...l
  };
  var c9 = {
//         ^
// [analyzer] unspecified
// [cfe] unspecified
    ?key: ?v,
    ...l
  };
}
