/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let the element type of a list literal be the static type of the
 * type argument used to create the list. So <int>[] has an element type of int.
 * It may be explicit or filled in by type inference. So [1, 2.0] has an element
 * type of num.
 *
 * @description Checks that element type of the list literals is the static type
 * of the type argument used to create the list
 * @author sgrekhov@unipro.ru
 */

main() {
  bool b = true;
  var collection = <double>[3, 1.0, 4, 1, 5];

  List<int> list = [if (b) 1.0];                      //# 01: compile-time error
  List<int> list = [if (!b) 1.0,];                    //# 02: compile-time error
  List<int> list = [if (b) for (var v in collection) if (v > 3) v,]; //# 03: compile-time error
  List<int> list = [if (!b) for (var v in collection) if (v > 3) v]; //# 04: compile-time error

  List list = <int>[if (b) 1.0];                      //# 05: compile-time error
  List list = <int>[if (!b) 1.0,];                    //# 06: compile-time error
  List list = <int>[if (b) for (var v in collection) if (v > 3) v,]; //# 07: compile-time error
  List list = <int>[if (!b) for (var v in collection) if (v > 3) v]; //# 08: compile-time error

  const list = <int>[if (1 > 2) 1.0];                 //# 09: compile-time error
  const list = <int>[if (2 > 1) 1.0,];                //# 10: compile-time error

  var list = const <int>[if (1 > 2) 1.0];             //# 11: compile-time error
  var list = const <int>[if (2 > 1) 1.0,];            //# 12: compile-time error
}
