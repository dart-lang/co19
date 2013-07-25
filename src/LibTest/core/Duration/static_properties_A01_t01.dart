/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static Properties
 * const int HOURS_PER_DAY
 * const int MICROSECONDS_PER_DAY
 * const int MICROSECONDS_PER_HOUR
 * const int MICROSECONDS_PER_MILLISECOND
 * const int MICROSECONDS_PER_MINUTE
 * const int MICROSECONDS_PER_SECOND
 * const int MILLISECONDS_PER_DAY
 * const int MILLISECONDS_PER_HOUR
 * const int MILLISECONDS_PER_MINUTE
 * const int MILLISECONDS_PER_SECOND
 * const int MINUTES_PER_DAY
 * const int MINUTES_PER_HOUR
 * const int SECONDS_PER_DAY
 * const int SECONDS_PER_HOUR
 * const int SECONDS_PER_MINUTE
 * const Duration ZERO
 * @description Checks that all mentioned static properties declared.
 * @author kaigorodov
 */

var sum;

main() {
  sum=Duration.HOURS_PER_DAY
   + Duration.HOURS_PER_DAY
   + Duration.MICROSECONDS_PER_DAY
   + Duration.MICROSECONDS_PER_HOUR
   + Duration.MICROSECONDS_PER_MILLISECOND
   + Duration.MICROSECONDS_PER_MINUTE
   + Duration.MICROSECONDS_PER_SECOND
   + Duration.MILLISECONDS_PER_DAY
   + Duration.MILLISECONDS_PER_HOUR
   + Duration.MILLISECONDS_PER_MINUTE
   + Duration.MILLISECONDS_PER_SECOND
   + Duration.MINUTES_PER_DAY
   + Duration.MINUTES_PER_HOUR
   + Duration.SECONDS_PER_DAY
   + Duration.SECONDS_PER_HOUR
   + Duration.SECONDS_PER_MINUTE
   + Duration.ZERO.inMilliseconds;
}
