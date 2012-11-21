/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the association for the given [key]. Returns null if
 * [key] is not in the map.
 * @description Try to remove null key and check that Error is thrown.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  try {
    map.remove(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {} //Not documented
}
