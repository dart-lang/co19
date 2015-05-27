/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <pre id="console"></pre>
      <canvas id="c" class="output" width="100" height="50"><p class="fallback">FAIL (fallback content)</p></canvas>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var canvas = document.getElementById("c");
  var ctx = canvas.getContext("2d");

  clearContextToGreen() {
    ctx.globalCompositeOperation="source-over";
    ctx.fillStyle = "rgb(0, 255, 0)";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
  }

  var testData = [
  {'compositeMode': 'source-over', 'expected': [0, 0, 255]},
  {'compositeMode': 'source-in', 'expected': [0, 0, 255]},
  {'compositeMode': 'source-out', 'expected': [0, 0, 0]},
  {'compositeMode': 'source-atop', 'expected': [0, 0, 255]},
  {'compositeMode': 'destination-over', 'expected': [0, 255, 0]},
  {'compositeMode': 'destination-in', 'expected': [0, 255, 0]},
  {'compositeMode': 'destination-out', 'expected': [0, 0, 0]},
  {'compositeMode': 'destination-atop', 'expected': [0, 255, 0]},
  {'compositeMode': 'lighter', 'expected': [0, 255, 255]},
  {'compositeMode': 'copy', 'expected': [0, 0, 255]},
  {'compositeMode': 'xor', 'expected': [0, 0, 0]},
  ];

  toHexString(number) {
    var hexString = number.toRadixString(16).toUpperCase();
    if (number <= 9)
      hexString = '0' + hexString;
    return hexString;
  }

  doTest(dataItem, fillSize) {
    clearContextToGreen();
    ctx.fillStyle = "rgb(0, 0, 255)";
    ctx.globalCompositeOperation = dataItem['compositeMode'];
    ctx.fillRect(0, 0, fillSize, fillSize);

    var data = ctx.getImageData(0, 0, canvas.width, canvas.height);
    var pixelOK = true;
    var pixelString = '#';
    var expectedString = '#';

    for (var x = 0; x < 3; x++) {
      pixelString = pixelString + toHexString(data.data[x]);
      expectedString = expectedString + toHexString(dataItem['expected'][x]);
      if (data.data[x] != dataItem['expected'][x])
        pixelOK = false;
    }

    var testName = "Fill Size $fillSize, ${dataItem['compositeMode']}";
    if (pixelOK)
      testPassed(testName + ': ' + pixelString);
    else
      testFailed(testName + ': EXPECTED ' + expectedString + ', GOT ' + pixelString);
  }

  debug("Tests that using the different composite modes to fill large rects doesn't crash and works as expected.");
  [10000, 50000, 100000].forEach((fillSize) {
    testData.forEach((dataItem) {
      doTest(dataItem, fillSize);
    });
  });
}
