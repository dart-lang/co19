/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check stepMismatch results for type=date.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  document.body.append(input);

  stepMismatchFor(value, step, min, [disabled=false]) {
    input.min = min;
    input.step = step;
    input.value = value;
    input.disabled = disabled;
    return input.validity.stepMismatch;
  }

  input.type = 'date';
  debug('Empty values');
  //shouldBeFalse(stepMismatchFor("", null, null));
  shouldBeFalse(stepMismatchFor("", "2", "1969-12-31"));
  debug('Normal step values');
  shouldBeTrue(stepMismatchFor("2010-02-10", "2", "2010-02-09"));
  shouldBeFalse(stepMismatchFor("2010-02-09", "2", "2010-02-09"));
  shouldBeFalse(stepMismatchFor("2010-02-11", "2", "2010-02-09"));
  shouldBeTrue(stepMismatchFor("1800-11-11", "3", "1800-11-09"));
  shouldBeFalse(stepMismatchFor("1800-11-09", "3", "1800-11-09"));
  shouldBeFalse(stepMismatchFor("1800-11-12", "3", "1800-11-09"));
  shouldBeTrue(stepMismatchFor("275760-09-13", "3", "275760-09-11"));
  shouldBeFalse(stepMismatchFor("275760-09-13", "2", "275760-09-11"));
  debug('Implicit step base');
  //shouldBeTrue(stepMismatchFor("1970-01-02", "2", null));
  //shouldBeFalse(stepMismatchFor("1970-01-03", "2", null));
  debug('Fractional step values');
  shouldBeFalse(stepMismatchFor("2010-02-10", "0.1", "2010-02-09"));
  shouldBeFalse(stepMismatchFor("2010-02-10", "1.1", "2010-02-09"));
  shouldBeTrue(stepMismatchFor("2010-02-10", "1.9", "2010-02-09"));
  debug('Invalid or no step values');
  //shouldBeFalse(stepMismatchFor("2010-02-10", null, "2010-02-09"));
  shouldBeFalse(stepMismatchFor("2010-02-10", "-1", "2010-02-09"));
  shouldBeFalse(stepMismatchFor("2010-02-10", "foo", "2010-02-09"));
  debug('Special step value');
  shouldBeFalse(stepMismatchFor("2010-02-10", "any", "2010-02-09"));
  debug('Disabled');
  shouldBeFalse(stepMismatchFor("2010-02-10", "2", "2010-02-09", true));
}
