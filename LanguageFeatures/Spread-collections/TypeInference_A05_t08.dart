// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion From the Unified collections Spec:
 * We require that at least one component unambiguously determine the literal
 * form, otherwise it is a compile-time error. So, given:
 *    dynamic x = <int, int>{};
 *    Iterable l = [];
 *    Map m = {};
 *    Then:
 *    {...x}       // Static error, because it is ambiguous.
 *    {...x, ...l} // Statically a set, runtime error when spreading x.
 *    {...x, ...m} // Statically a map, no runtime error.
 *    {...l, ...m} // Static error, because it must be both a set and a map.
 * @description Checks that {...?l, ...?m} is a static error
 * @author iarkh@unipro.ru
 */

main() {
  Iterable l = [];
  Map m = {};

  var res1   = {...?l, ...m};
// [error line 26, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res2   = {...m, ...?l};
// [error line 30, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List res3  = {...?l, ...m};
// [error line 34, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map res4   = {...?l, ...m};
// [error line 38, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  var res5   = {...l, ...?m};
// [error line 43, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res6   = {...?m, ...l};
// [error line 47, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List res7  = {...l, ...?m};
// [error line 51, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map res8   = {...l, ...?m};
// [error line 55, column 0]
// [analyzer] unspecified
// [cfe] unspecified

  var res9   = {...?l, ...?m};
// [error line 60, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  var res10  = {...?m, ...?l};
// [error line 64, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  List res11 = {...?l, ...?m};
// [error line 68, column 0]
// [analyzer] unspecified
// [cfe] unspecified
  Map res12  = {...?l, ...?m};
// [error line 72, column 0]
// [analyzer] unspecified
// [cfe] unspecified

}
