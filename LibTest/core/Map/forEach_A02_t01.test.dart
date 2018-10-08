/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void forEach(void f(K key, V value))
 * It is an error to add or remove keys from the map during iteration.
 * @description Tries to remove or add entries in [f] while iterating over the
 * map, expects a ConcurrentModificationError every time regardless of whether
 * or not it is the current key that's being removed.
 * @author msyabro
 */
library forEach_A02_t01;

import "../../../Utils/expect.dart";

test(Map create([Map content])) {
  Map map = create();
  
  map["1"] = 3;
  map["2"] = 5;

  Expect.throws(() {
      map.forEach((var key, var value) {
        map["3"] = key;
      });
    }, (e)=> e is ConcurrentModificationError
  );
  
  Expect.throws(() {
      map.forEach((var key, var value) {
        map.remove("2");
      });
    }, (e)=> e is ConcurrentModificationError
  );
  Expect.throws(() {
      map.forEach((var key, var value) {
        map.remove(key);
      });
    }, (e)=> e is ConcurrentModificationError
  );
  
  map["1"] = 1;
  map["2"] = 2;
  Expect.throws(() {
      map.forEach((var key, var value) {
        map.clear();
      });
    }, (e)=> e is ConcurrentModificationError
  );
}
