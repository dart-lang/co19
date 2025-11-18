// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable. Test literals
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  var set = <Object>{
    ?42,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?0x1,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?3.14,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?true,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?false,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?" String ",
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?'''  Triple quoted string   ''',
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?r'  Raw string   ',
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?#void
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.setEquals({
    42,
    0x1,
    3.14,
    true,
    false,
    " String ",
    '''  Triple quoted string   ''',
    r'  Raw string   ',
    #void
  }, set);

  var list = <Object>[
    ?42,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?0x1,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?3.14,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?true,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?false,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?" String ",
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?'''  Triple quoted string   ''',
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?r'  Raw string   ',
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?#void
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  ];
  Expect.listEquals([
    42,
    0x1,
    3.14,
    true,
    false,
    " String ",
    '''  Triple quoted string   ''',
    r'  Raw string   ',
    #void
  ], list);

  var map1 = <Object, int>{
    ?42: 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?0x1: 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?3.14: 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?true: 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?false: 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?" String ": 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?'''  Triple quoted string   ''': 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?r'  Raw string   ': 0,
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    ?#void: 0
//  ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({
    42: 0,
    0x1: 0,
    3.14: 0,
    true: 0,
    false: 0,
    " String ": 0,
    '''  Triple quoted string   ''': 0,
    r'  Raw string   ': 0,
    #void: 0
  }, map1);

  var map2 = <int, Object>{
    1: ?42,
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    2: ?0x1,
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    3: ?3.14,
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    4: ?true,
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    5: ?false,
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    6: ?" String ",
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    7: ?'''  Triple quoted string   ''',
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    8: ?r'  Raw string   ',
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
    9: ?#void
//     ^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  };
  Expect.mapEquals({
    1: 42,
    2: 0x1,
    3: 3.14,
    4: true,
    5: false,
    6: " String ",
    7: '''  Triple quoted string   ''',
    8: r'  Raw string   ',
    9: #void
  }, map2);
}
