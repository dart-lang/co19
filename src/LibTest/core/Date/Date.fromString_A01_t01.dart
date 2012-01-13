/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromString(String formattedString) constructs a new [Date] instance 
 * based on [formattedString]
 * @description Checks that the Date instance is created.
 * @author hlodvig
 * @reviewer msyabro
 */

main(){
  Expect.isTrue(new Date.fromString(new Date.now().toString()) is Date);
}
