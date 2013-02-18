/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if there is no {key, value} pair in the map.
 * @description Check that true is returned only if the map is empty.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Expect.isTrue(map.isEmpty);
  
  map["1"] = 1;
  Expect.isTrue(!map.isEmpty);
  
  map.remove("1");
  Expect.isTrue(map.isEmpty);
}
