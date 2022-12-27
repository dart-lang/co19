// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern | '...'
/// ...
/// Like lists, map patterns can also have a rest pattern. However, there's no
/// well-defined notion of a map "minus" some set of matched entries. Thus, the
/// rest pattern doesn't allow a subpattern to capture the "remaining" entries.
///
/// Also, there is no ordering to entries in a map, so we only allow the ... to
/// appear as the last element. Appearing anywhere else would send a confusing,
/// meaningless signal.
///
/// Any two record keys which both have primitive == are equal. Since records
/// don't have defined identity, we can't use the previous rule to detect
/// identical records. But records do support an equality test known at compile
/// time if all of their fields do, so we use that.
///
/// @description Check that it is a compile-time error if rest pattern of a map
/// declares a variable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Map map) {
  return switch (map) {
    {1: 1, 2: > 0, ...r1} => "case-1",
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
    {1: 2, 2: <= 0, ... var r2} => "case-2",
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    {1: 3, 2: var a, ... final r3} => "case-3",
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    {1: 3, 2: var a, ... Map r4} => "case-4",
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    {1: 3, 2: var a, ... _} => "case-5",
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String test2(Map map) {
  switch (map) {
    case {1: 1, 2: > 0, ...r1}: return "case-1";
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
    case {1: 2, 2: <= 0, ... var r2}: return "case-2";
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
    case {1: 3, 2: var a, ...final r3}: return "case-3";
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
    case {1: 3, 2: var a, ...Map r4}: return "case-4";
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
    case {1: 3, 2: var a, ... _}: return "case-5";
//                            ^
// [analyzer] unspecified
// [cfe] unspecified
    default:
      return "default";
  }
}

String test3(Map map) {
  if (map case {1: 1, 2: > 0, ...r1}) {
//                               ^^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-1";
  }
  if (map case {1: 2, 2: <= 0, ... var r2}) {
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-2";
  }
  if (map case {1: 3, 2: var a, ...final r3}) {
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-3";
  }
  if (map case {1: 3, 2: var a, ...Map r4}) {
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-3";
  }
  if (map case {1: 3, 2: var a, ... _}) {
//                                  ^
// [analyzer] unspecified
// [cfe] unspecified
    return "case-3";
  }
  return "default";
}

main() {
  var {1: a, 2: b, ...r1} = {1: 1, 2: 2, 3: 3};
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified

  final {1: 2, 2: int c, ...r2} = {1: 2, 2: 2, 3: 3};
//                          ^^
// [analyzer] unspecified
// [cfe] unspecified

  var {1: 3, 2: _, ...Map r3} = {1: 3, 2: 2, 3: 3};
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  final {1: 2, 2: int c, ..._} = {1: 2, 2: 2, 3: 3};
//                          ^
// [analyzer] unspecified
// [cfe] unspecified

  test1({});
  test2({});
  test3({});
}
