/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * Adds the contents of obj, converted to a string, to the buffer.
 * @description Tries to pass null or an object that isn't a String as argument,
 * correct string conversion expected ("null" in case of null)
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  sb.write(null);
  Expect.equals("null", sb.toString());
  sb.write(1);
  Expect.equals("null1", sb.toString());
  sb.write(true);
  Expect.equals("null1true", sb.toString());
}
