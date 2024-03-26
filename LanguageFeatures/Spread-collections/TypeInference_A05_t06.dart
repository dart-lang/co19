// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion From the Unified collections Spec:
/// We require that at least one component unambiguously determine the literal
/// form, otherwise it is a compile-time error. So, given:
///    dynamic x = <int, int>{};
///    Iterable l = [];
///    Map m = {};
///    Then:
///    {...x}       // Static error, because it is ambiguous.
///    {...x, ...l} // Statically a set, runtime error when spreading x.
///    {...x, ...m} // Statically a map, no runtime error.
///    {...l, ...m} // Static error, because it must be both a set and a map.
///
/// @description Checks that if one of the spreadable element is [Map], result
/// is statically [Map]
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

main() {
  dynamic map = <int, int>{};
  dynamic set = <int>{};
  Map m = {};

  Expect.throws(() =>  res = {...?m, ...set});
//                            ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.throws(() =>  res = {...set, ...?m});
//                                    ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.throws(() =>  res = {...m, ...?set});
  Expect.throws(() =>  res = {...?set, ...m});

  Expect.throws(() =>  res = {...?set, ...?m});
//                                     ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.isTrue({...?map, ...m} is Map);
  Expect.runtimeIsType<Map>({...?map, ...m});
  Expect.isTrue({...m, ...?map} is Map);
  Expect.runtimeIsType<Map>({...m, ...?map});

  Expect.isTrue({...map, ...?m} is Map);
//                       ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<Map>({...map, ...?m});
//                                   ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.isTrue({...?m, ...map} is Map);
//               ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<Map>({...?m, ...map});
//                           ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR

  Expect.isTrue({...?map, ...?m} is Map);
//                        ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.runtimeIsType<Map>({...?map, ...?m});
//                                    ^^^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
}
