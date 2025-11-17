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

// TODO(sgrekhov): replace unspecified by the actual lint name

import '../../../Utils/expect.dart';

main() {
  var set = <Object>{
    ?42,
//  ^
// [analyzer] unspecified
    ?0x1,
//  ^
// [analyzer] unspecified
    ?3.14,
//  ^
// [analyzer] unspecified
    ?true,
//  ^
// [analyzer] unspecified
    ?false,
//  ^
// [analyzer] unspecified
    ?" String ",
//  ^
// [analyzer] unspecified
    ?'''  Triple quoted string   ''',
//  ^
// [analyzer] unspecified
    ?r'  Raw string   ',
//  ^
// [analyzer] unspecified
    ?#void
//  ^
// [analyzer] unspecified
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
// [analyzer] unspecified
    ?0x1,
//  ^
// [analyzer] unspecified
    ?3.14,
//  ^
// [analyzer] unspecified
    ?true,
//  ^
// [analyzer] unspecified
    ?false,
//  ^
// [analyzer] unspecified
    ?" String ",
//  ^
// [analyzer] unspecified
    ?'''  Triple quoted string   ''',
//  ^
// [analyzer] unspecified
    ?r'  Raw string   ',
//  ^
// [analyzer] unspecified
    ?#void
//  ^
// [analyzer] unspecified
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
// [analyzer] unspecified
    ?0x1: 0,
//  ^
// [analyzer] unspecified
    ?3.14: 0,
//  ^
// [analyzer] unspecified
    ?true: 0,
//  ^
// [analyzer] unspecified
    ?false: 0,
//  ^
// [analyzer] unspecified
    ?" String ": 0,
//  ^
// [analyzer] unspecified
    ?'''  Triple quoted string   ''': 0,
//  ^
// [analyzer] unspecified
    ?r'  Raw string   ': 0,
//  ^
// [analyzer] unspecified
    ?#void: 0
//  ^
// [analyzer] unspecified
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
// [analyzer] unspecified
    2: ?0x1,
//     ^
// [analyzer] unspecified
    3: ?3.14,
//     ^
// [analyzer] unspecified
    4: ?true,
//     ^
// [analyzer] unspecified
    5: ?false,
//     ^
// [analyzer] unspecified
    6: ?" String ",
//     ^
// [analyzer] unspecified
    7: ?'''  Triple quoted string   ''',
//     ^
// [analyzer] unspecified
    8: ?r'  Raw string   ',
//     ^
// [analyzer] unspecified
    9: ?#void
//     ^
// [analyzer] unspecified
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
