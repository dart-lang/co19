/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that unicode-range descriptor is used to selectively
 * download fonts that are used in document.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
          font-family: TestFont;
          src: url('$root/../../resources/Ahem.ttf');
          unicode-range: U+00-0FF;  /* Latin-1 */
      }
      @font-face {
          font-family: TestFont;
          src: url('$root/../../resources/Ahem.otf');
          unicode-range: U+0400-04FF;  /* Cyrillic */
      }
      @font-face {
          font-family: TestFont;
          src: url('$root/../../resources/Ahem.woff');
          unicode-range: U+0600-06FF;  /* Arabic */
      }
      #test {
          font-family: TestFont;
      }

      @font-face {
          font-family: SingleCharacterOverride;
          src: url('$root/../../resources/Ahem.woff');
          unicode-range: U+E000;
      }
      #test2 {
          font-family: SingleCharacterOverride;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="test">&#x41F;&#x440;&#x43E;&#x432;&#x435;&#x440;&#x43A;&#x430;</p>
      <p id="test2">hello</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var cyrillicLoaded = false;
  var arabicLoaded = false;
  var iconLoaded = false;

  onloadingdone(e) {
    for (var i = 0; i < e.fontfaces.length; i++) {
      var range = e.fontfaces[i].unicodeRange;
      if (range == 'U+400-4FF')
        cyrillicLoaded = true;
      if (range == 'U+600-6FF')
        arabicLoaded = true;
      if (range == 'U+E000')
        iconLoaded = true;
    }

    shouldBeTrue(cyrillicLoaded);
    shouldBeFalse(arabicLoaded);
    shouldBeFalse(iconLoaded);
    asyncEnd();
  }

  runTests() {
    asyncStart();
    document.fonts.addEventListener('loadingdone', onloadingdone);
  }

  if (document.fonts != null)
    runTests();
  else {
    testFailed('document.fonts does not exist');
  }
}
