/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests: the TABLE.createCaption() method
 * If no caption exists, the method should create an empty caption, add it to 
 * the table, and return a pointer to it. 
 * If a caption does exist, the method should return a pointer to it.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <table id="fruitTable" border="1">
    <tr>
    <th>Fruit</th>
    <th>Color</th>
    </tr>
    <tr>
    <td>Banana</td>
    <td>Yellow</td>
    </tr>
    <tr>
    <td>Grape</td>
    <td>Purple</td>
    </tr>
    </table>

    <br>

    <table id="veggieTable" border="1">
    <caption> Things </caption>
    <tr>
    <th>Vegetable</th>
    <th>Color</th>
    </tr>
    <tr>
    <td>Carrot</td>
    <td>Orange</td>
    </tr>
    <tr>
    <td>Cucumber</td>
    <td>Green</td>
    </tr>
    </table>
    ''', treeSanitizer: new NullTreeSanitizer());

  captionfruit() {
    var x =
       (document.getElementById('fruitTable') as TableElement).createCaption();
    x.innerHtml="<b>Fruity</b>";
  }

  captionveggie() {
    var x =
      (document.getElementById('veggieTable') as TableElement).createCaption();
    x.innerHtml="<b>Vegetabley</b>";
  }

  captionfruit();
  captionveggie();

  var captions = document.body.queryAll('caption');
  shouldBe(captions.length, 2);
  shouldBe(captions[0].text, "Fruity");
  shouldBe(captions[1].text, "Vegetabley");
}
