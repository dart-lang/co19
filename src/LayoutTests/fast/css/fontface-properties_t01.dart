/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test getting/setting FontFace properties.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      @font-face {
        font-family: 'Ahem';
        src: url(../../resources/Ahem.ttf);
        font-style: italic;
        font-weight: 300;
        unicode-range: U+0-3FF;
        font-variant: small-caps;
        -webkit-font-feature-settings: "dlig" 1;
        /* font-stretch property is not supported */
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  getDocumentFontFaces() {
    var faces = [];
    document.fonts.forEach((face,_,__) { faces.add(face); });
    return faces;
  }

  runTests() {
    var ahemFace = getDocumentFontFaces()[0];
    shouldBeEqualToString(ahemFace.family, 'Ahem');
    shouldBeEqualToString(ahemFace.style, 'italic');
    shouldBeEqualToString(ahemFace.weight, '300');
    shouldBeEqualToString(ahemFace.unicodeRange, 'U+0-3FF');
    shouldBeEqualToString(ahemFace.variant, 'small-caps');
    shouldBeEqualToString(ahemFace.featureSettings, "'dlig' 1");

    debug('');
    var defaultFace = new FontFace('defaultFace', 'local(foo)', {});
    shouldBeEqualToString(defaultFace.family, 'defaultFace');
    shouldBeEqualToString(defaultFace.style, 'normal');
    shouldBeEqualToString(defaultFace.weight, 'normal');
    shouldBeEqualToString(defaultFace.stretch, 'normal');
    shouldBeEqualToString(defaultFace.unicodeRange, 'U+0-10FFFF');
    shouldBeEqualToString(defaultFace.variant, 'normal');
    shouldBeEqualToString(defaultFace.featureSettings, 'normal');

    debug('');
    var constructedFace = new FontFace('constructedFace', 'local(bar)', {
      'style': 'oblique',
      'weight': 'bold',
      'unicodeRange': 'U+100-1FF, U+ABCD',
      'variant': 'small-caps',
      'featureSettings': "'liga' 0"
    });
    shouldBeEqualToString(constructedFace.family, 'constructedFace');
    shouldBeEqualToString(constructedFace.style, 'oblique');
    shouldBeEqualToString(constructedFace.weight, 'bold');
    shouldBeEqualToString(constructedFace.unicodeRange, 'U+100-1FF, U+ABCD');
    shouldBeEqualToString(constructedFace.variant, 'small-caps');
    shouldBeEqualToString(constructedFace.featureSettings, "'liga' 0");

    debug('');
    var modifiedFace = new FontFace('unmodified', 'local(baz)', {});
    modifiedFace.family = 'modified';
    modifiedFace.style = 'italic';
    modifiedFace.weight = '900';
    modifiedFace.unicodeRange = 'U+0-3FF';
    modifiedFace.variant = 'small-caps';
    modifiedFace.featureSettings = "'dlig' 1, 'liga' 0";
    shouldBeEqualToString(modifiedFace.family, 'modified');
    shouldBeEqualToString(modifiedFace.style, 'italic');
    shouldBeEqualToString(modifiedFace.weight, '900');
    shouldBeEqualToString(modifiedFace.unicodeRange, 'U+0-3FF');
    shouldBeEqualToString(modifiedFace.variant, 'small-caps');
    shouldBeEqualToString(modifiedFace.featureSettings, "'dlig' 1, 'liga' 0");

    debug('');
    shouldThrow(() => new FontFace('test', 'invalid_src', {}));
    var face = new FontFace('test', 'local(foo)', {});
    shouldThrow(() => face.style = '');
    shouldThrow(() => face.weight = 'a');
    shouldThrow(() => face.unicodeRange = 'U+');
    shouldThrow(() => face.variant = '???');
    shouldThrow(() => face.featureSettings = null);
  }

  if (document.fonts != null)
    runTests();
  else {
    testFailed('document.fonts does not exist');
  }
}
