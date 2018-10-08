/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that only necessary fonts are loaded when font faces have
 * overlapping unicode ranges.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
          font-family: Test1;
          src: url('$root/../../resources/Ahem.ttf');
          unicode-range: U+41-5A;  /* 'A'-'Z' */
      }
      @font-face {
          font-family: Test1;
          src: url('$root/../../resources/Ahem.otf');
          unicode-range: U+49;  /* 'I' */
      }
      @font-face {
          font-family: Test2;
          src: url('$root/../../resources/Ahem.woff');
          unicode-range: U+41-5A;  /* 'A'-'Z' */
      }
      @font-face {
          font-family: Test2;
          src: url('$root/../../resources/Ahem.woff2');
          unicode-range: U+49;  /* 'I' */
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p style="font-family: Test1">I</p>
      <p style="font-family: Test2">J</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  getDocumentFontFaces() {
    var faces = [];
    document.fonts.forEach((face,_,__) { faces.add(face); });
    return faces;
  }

  asyncStart();
  document.fonts.addEventListener('loadingdone', (_) {
    var faces = getDocumentFontFaces();
    shouldBe(faces.length, 4);
    shouldBeEqualToString(faces[0].status, 'unloaded');
    shouldBeEqualToString(faces[1].status, 'loaded');
    shouldBeEqualToString(faces[2].status, 'loaded');
    shouldBeEqualToString(faces[3].status, 'unloaded');
    asyncEnd();
  });
}
