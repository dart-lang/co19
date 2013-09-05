/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  * @assertion abstract Map<int, E> asMap()
 * Returns an unmodifiable Map view of this.
 * It has the indices of this list as keys, and the corresponding elements as values.
 * @description Checks that the method returns Map.
 * Checks that the returned Map is unmodifiable.
 * Checks that the returned Map has the indices of this list as keys.
 * Checks that the returned Map has the corresponding elements as values.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List a) {
  var map=a.asMap();
  Expect.isTrue(map is Map);

  Expect.throws(() {
    map["key"]="value"; 
  }
  ,(e)=>true
  ,"modification did not fail"
  );

  Expect.equals(map.length, a.length);

  int count=0;
  map.forEach((key, value){
     Expect.equals(map[key], a[key]);
     count++;
  });
  Expect.equals(a.length, count);
  
  for (int key=0; key<a.length; key++) {
    Expect.isTrue(map.containsKey(key));
    Expect.equals(map[key], a[key]);
  }
}

main() {
  List a=new List();
  check(a);
  a.add(2);
  check(a);
  a.add(1);
  check(a);
  a.add(1);
  check(a);
  a.add("1");
  check(a);
  a.clear();
  check(a);
}
