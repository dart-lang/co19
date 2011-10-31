/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date changeTimeZone(TimeZone targetTimeZone) returns an instance with the
 *  [value] equals to [this.value]
 * @description Checks that this.value is equal to newDateTime.value
 * @author hlodvig
 * @reviewer msyabro
 */
void check(dt){
  Expect.equals(dt.value, dt.changeTimeZone(new TimeZone.utc()).value);
  Expect.equals(dt.value, dt.changeTimeZone(new TimeZone.local()).value);
}

main() {
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone.utc()));
  check(new Date.withTimeZone(2001, 2, 3, 4, 5, 6, 7, new TimeZone.local()));
}
