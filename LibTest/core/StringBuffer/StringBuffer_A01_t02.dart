/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion new StringBuffer([Object content = ""])
 * Creates the string buffer with an initial content. 
 * @description Tries to pass an argument that is null or isn't a String,
 * correct string conversion expected ("null" in case of null)
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("null", new StringBuffer(null).toString());
  Expect.equals("1", new StringBuffer(1).toString());
  Expect.equals("true", new StringBuffer(true).toString());
}
