/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String stringify(Object object)
 * If a List or Map contains a reference to itself, directly or through other
 * lists or maps, it cannot be serialized and a JsonCyclicError is thrown.
 * @description Checks that if a List or Map contains a reference to itself
 * directly or through other lists or maps,
 * it cannot be serialized and a JsonCyclicError is thrown.
 * @note variable table in this test is used also in the test printOn_A04_t01.
 * @author kaigorodov
 */
import "../../Utils/expect.dart";
import "dart:json";

List cyclist1() {
  var res=[1,2,3];
  res.add(res);
  return res;
}

List cyclist2() {
  var res=[1,2,3];
  var intlist=[4,5,6];
  intlist.add(res);
  res.add(intlist);
  return res;
}

Map cycmap0() {
  Map<String, Object> res={};
  res["kkk"]=res;
  return res;
}

Map cycmap1() {
  Map<String, Object> res={"1":1, "2":2, "3":3};
  res["100"]=res;
  return res;
}

Map cycmap2() {
  Map<String, Object> res={"1":1, "2":2, "3":3};
  Map<String, Object> intlist={"4":4, "5":5, "6":6};
  intlist["54"]=res;
  res["22"]=intlist;
  return res;
}

List<Object> table=[
  cyclist1(),
  cyclist2(),
  cycmap0(),
  cycmap1(),
  cycmap2(),
];

main() {
  bool failed=false;
  for (Object obj in table) {
    try {
      String res=stringify(obj);
      print("error expected but result returned: $res");
      failed=true;
    } on JsonCyclicError catch(e) {
    }
    if (failed) {
      Expect.fail("");
    }
  }
}
