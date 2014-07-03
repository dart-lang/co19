/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that setLineDash converts input argument into a Web IDL
 * sequence
 */
import "dart:html";
import "dart:math" as Math;
import "dart:typed_data";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '700');
  canvas.setAttribute('height', '700');
  var ctx = canvas.getContext('2d');

  var intValues = [5, 15, 25];
  var floatValues = [5.0, 15.0, 25.0];

  var arrays = [
    new List.from(intValues),
    new Int8List.fromList(intValues),
    new Int16List.fromList(intValues),
    new Int32List.fromList(intValues),
    new Uint8List.fromList(intValues),
    new Uint16List.fromList(intValues),
    new Uint32List.fromList(intValues),
    new Float32List.fromList(floatValues),
    new Float64List.fromList(floatValues),
    new Uint8ClampedList.fromList(intValues)];

  var lineDash;
  var inputArray;
  checkLineDash(testArray, shouldFail) {
    inputArray = testArray;
    // Reset line dash.
    ctx.setLineDash([]);
    // Set line dash.
    if (shouldFail) {
      shouldThrow(() => ctx.setLineDash(inputArray));
    } else {
      ctx.setLineDash(inputArray);
      lineDash = ctx.getLineDash();
      for (var i = 0; i < intValues.length; ++i)
        shouldBe(lineDash[i], intValues[i]);
    }
  }

  // Success cases.
  for (var x in arrays) {
    debug("* Test passing a ${x.runtimeType} as input.");
    checkLineDash(x, false);
  }

  // Failure cases.
  debug("* Test passing a DateTime as input.");
  checkLineDash(new DateTime.now(), true);
  debug("* Test passing a RegExp as input.");
  checkLineDash(new RegExp(''), true);
  debug("* Test passing a Number as input.");
  checkLineDash(3, true);
  debug("* Test passing a String as input.");
  checkLineDash("Test", true);
  debug("* Test passing a Boolean as input.");
  checkLineDash(true, true);
  debug("* Test passing null as input.");
  checkLineDash(null, true);
}
