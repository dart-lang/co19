/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.fromEpoch(int value, TimeZone timeZone) constructs a new [Date] instance
 * with the given time zone. The given [timeZone] must not be [:null:].
 * @description Checks that timeZone parameter cannot be [:null:]
 * @author hlodvig
 * @reviewer msyabro
 * @needsreview API do not specify which exception should or should not be raised if null is passed
 * to the function. Also it states the "must not be null", not the "can not be null".
 */

main() {
  bool fail = false;
  try{
    Date d1 = new Date.fromEpoch(0, null);
    fail = true;
  } catch(var ok) { }
  if(fail) {
    Expect.fail("Exception expected with the passed null value of the timeZone");
  }

  try{
    Date d2 = new Date.fromEpoch(new Date.now(), null);
    fail = true;
  } catch(var ok) {}
  if(fail) {
    Expect.fail("Exception expected with the passed null value of the timeZone");
  }
}
