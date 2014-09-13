/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test download error cases.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      /* Test 1: Invalid font data */
      @font-face {
          font-family: myfont1;
          src: url('$root/resources/invalidfont.png') format(opentype);
      }

      /* Test 2: Download error */
      @font-face {
          font-family: myfont2;
          src: url('resources/IntentionallyMissingFile.otf');
      }

      /* Test 3: Empty data url */
      @font-face {
          font-family: myfont3;
          src: url(data:application/x-truetype-font,) format(truetype);
      }

      /* Test 4: Download error followed by existing local font */
      @font-face {
          font-family: myfont4;
          src: url('resources/IntentionallyMissingFile.otf'), local('Courier New');
      }

      /* Test 5: Multiple errors */
      @font-face {
          font-family: myfont5;
          src: url('resources/IntentionallyMissingFile.otf'), url(data:application/x-truetype-font,) format(truetype);
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div style="font-family: myfont1">font1</div>
      <div style="font-family: myfont2">font2</div>
      <div style="font-family: myfont3">font3</div>
      <div style="font-family: myfont4">font4</div>
      <div style="font-family: myfont5">font5</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var event;
  var firedEvents = [];
  var failedFonts;

  finish() {
    shouldBeList(firedEvents, ['loading', 'loadingdone', 'loadingerror']);
    asyncEnd();
  }

  onLoading(e) {
    firedEvents.add(e.type);
  }

  onLoadingDone(e) {
    firedEvents.add(e.type);
    event = e;
    shouldBe(event.fontfaces.length, 1);
    shouldBeEqualToString(event.fontfaces[0].family, 'myfont4');
  }

  onLoadingError(e) {
    firedEvents.add(e.type);
    event = e;
    shouldBe(event.fontfaces.length, 4);
    failedFonts = e.fontfaces.map((face){return face.family;}).toList()..sort();
    shouldBeList(failedFonts, ['myfont1', 'myfont2', 'myfont3', 'myfont5']);
    finish();
  }

  runTests() {
    document.fonts.addEventListener('loading', onLoading);
    document.fonts.addEventListener('loadingdone', onLoadingDone);
    document.fonts.addEventListener('loadingerror', onLoadingError);

    //document.fonts.ready().then(finish);
  }

  asyncStart();

  if (document.fonts != null)
    runTests();
  else {
    testFailed('document.fonts does not exist');
    asyncEnd();
  }
}
