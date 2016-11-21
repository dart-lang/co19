/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description <select> selection test for scrolling.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var parent = document.createElement('div');
  parent.setInnerHtml('<select id="sl1" multiple size=5>'
    + '<option>one</option>'
    + '<option>two</option>'
    + '<option>three</option>'
    + '<option>four</option>'
    + '<option>five</option>'
    + '<option>six</option>'
    + '<option>seven</option>'
    + '<option>eight</option>'
    + '<option>nine</option>'
    + '<option>ten</option>'
    + '<option>eleven</option>'
    + '<option>twelve</option>'
    + '<option>thirteen</option>'
    + '<option>fourteen</option>'
    + '<option>fifteen</option>'
    + '<option>sixteen</option>'
    + '<option>seventeen</option>'
    + '</select>'
    + '<select id="sl2" multiple style="height: 135px; border: 10px solid; padding: 5px;">'
    + '<option>one</option>'
    + '<option>two</option>'
    + '<option>three</option>'
    + '</select>', treeSanitizer: new NullTreeSanitizer());
  document.body.append(parent);

  // Determine the item height.
  SelectElement sl1 = document.getElementById('sl1') as SelectElement;
  SelectElement sl2 = document.getElementById('sl2') as SelectElement;
  var itemHeight = floor(sl1.offsetHeight / sl1.size);
  sl1.attributes.remove('size');
  var height = itemHeight * 9 + 9;
  sl1.setAttribute('style', 'height: ${height}px; border: 10px solid; padding: 5px;');

  mouseDownOnSelect(selId, index) {
    debug('Testing $selId $index');
    var sl = document.getElementById(selId);
    var borderPaddingTop = 15;
    var borderPaddingLeft = 15;
    var y = index * itemHeight + itemHeight ~/ 3 - window.pageYOffset + borderPaddingTop;
    var event = new MouseEvent("mousedown", canBubble: true, cancelable: true,
        view: window, detail: 1,
        screenX: sl.offsetLeft +  borderPaddingLeft, screenY: sl.offsetTop + y,
        clientX: sl.offsetLeft + borderPaddingLeft, clientY: sl.offsetTop + y,
        ctrlKey: false, altKey: false, shiftKey: false, metaKey: false,
        button: 0, relatedTarget: document);
    //event.initMouseEvent("mousedown", true, true, document.defaultView, 1, sl.offsetLeft +  borderPaddingLeft, sl.offsetTop + y, sl.offsetLeft + borderPaddingLeft, sl.offsetTop + y, false, false, false, false, 0, document);
    sl.dispatchEvent(event);
  }

  String selectionPattern(String selectId) {
    SelectElement select = document.getElementById(selectId) as SelectElement;
    String result = "";
    for (var i = 0; i < select.options.length; i++)
      result += select.options[i].selected ? '1' : '0';
    return result;
  }

  mouseDownOnSelect("sl1", 0);
  shouldBe(selectionPattern("sl1"), "10000000000000000");

  mouseDownOnSelect("sl1", 1);
  shouldBe(selectionPattern("sl1"), "01000000000000000");

  mouseDownOnSelect("sl1", 6);
  shouldBe(selectionPattern("sl1"), "00000010000000000");

  mouseDownOnSelect("sl1", 7);
  shouldBe(selectionPattern("sl1"), "00000001000000000");

  mouseDownOnSelect("sl1", 8);
  shouldBe(selectionPattern("sl1"), "00000001000000000");

  mouseDownOnSelect("sl1", 0);
  shouldBe(selectionPattern("sl1"), "01000000000000000");

  for (var i = 0; i < 9; i++)
    mouseDownOnSelect("sl1", 7);
  shouldBe(selectionPattern("sl1"), "00000000000000001");

  mouseDownOnSelect("sl2", 1);
  shouldBe(selectionPattern("sl2"), "010");

  mouseDownOnSelect("sl2", 3);
  shouldBe(selectionPattern("sl2"), "010");

  mouseDownOnSelect("sl2", 2);
  shouldBe(selectionPattern("sl2"), "001");
}
