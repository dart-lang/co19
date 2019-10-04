/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let the key type and value type of a map literal be the
 * corresponding static types of the type arguments for a map literal.
 * So <int, String>{} and {1: "s"} both have a key type of int and a value type
 * of String
 *
 * @description Checks that element type of the map literals is the static type
 * of the type argument used to create the map
 * @author sgrekhov@unipro.ru
 */

main() {
  bool b = true;
  var collection = [3, 1, 4, 1, 5];

  Map<String, int> map = {if (b) "1": 1.0};           //# 01: compile-time error
  Map<String, int> map = {if (b) 1: 1};               //# 02: compile-time error
  Map<String, int> map = {if (!b) "1": 1.0,};         //# 03: compile-time error
  Map<String, int> map = {if (!b) 1: 1};              //# 04: compile-time error
  Map<String, int> map = {if (b) for (var v in collection) if (v > 3) "$v": "$v",}; //# 05: compile-time error
  Map<String, int> map = {if (b) for (var v in collection) if (v > 3) v: v,};       //# 06: compile-time error
  Map<String, int> map = {if (!b) for (var v in collection) if (v > 3) "$v": "$v"}; //# 07: compile-time error
  Map<String, int> map = {if (!b) for (var v in collection) if (v > 3) v: v,};      //# 08: compile-time error

  Map map = <String, int>{if (b) "1": 1.0};           //# 09: compile-time error
  Map map = <String, int>{if (b) 1: 1};               //# 10: compile-time error
  Map map = <String, int>{if (!b) "1": 1.0,};         //# 11: compile-time error
  Map map = <String, int>{if (!b) 1: 1};              //# 12: compile-time error
  Map map = <String, int>{if (b) for (var v in collection) if (v > 3) "$v": "$v",}; //# 13: compile-time error
  Map map = <String, int>{if (b) for (var v in collection) if (v > 3) v: v,};    //# 14: compile-time error
  Map map = <String, int>{if (!b) for (var v in collection) if (v > 3) "$v": "$v"}; //# 15: compile-time error
  Map map = <String, int>{if (!b) for (var v in collection) if (v > 3) v: v,};   //# 16: compile-time error

  const map = <String, int>{if (1 > 2) "1": 1.0};     //# 17: compile-time error
  const map = <String, int>{if (2 > 1) "1": 1.0,};    //# 18: compile-time error
  const map = <String, int>{if (1 > 2) 1: 1};         //# 19: compile-time error
  const map = <String, int>{if (2 > 1) 1: 1,};        //# 20: compile-time error

  var map = const <String, int>{if (1 > 2) "1": 1.0}; //# 21: compile-time error
  var map = const <String, int>{if (2 > 1) "1": 1.0,};//# 22: compile-time error
  var map = const <String, int>{if (1 > 2) 1: 1};     //# 23: compile-time error
  var map = const <String, int>{if (2 > 1) 1: 1,};    //# 24: compile-time error
}
