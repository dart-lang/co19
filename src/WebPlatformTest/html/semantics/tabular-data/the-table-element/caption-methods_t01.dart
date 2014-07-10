/**
 * after web-platform-tests/html/semantics/tabular-data/the-table-element/caption-methods.html
 * @assertion
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#the-table-element" />
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#dom-table-createcaption" />
 *  <link rel="help" href="http://www.w3.org/TR/html5/tabular-data.html#dom-table-deletecaption" />
 * @description Creating and deleting captions
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
    <table id="table1" style="display:none">
        <caption id="caption1">caption</caption>
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
    <table id="table2" style="display:none">
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
    <table id="table3" style="display:none">
        <caption id="caption3">caption 3</caption>
        <tr>
            <td>cell</td>
            <td>cell</td>
        </tr>
    </table>
''';

void main() {
    document.body.appendHtml(htmlEL);
    
	test( () {
		var table1 = document.getElementById('table1');
		var testCaption = table1.createCaption();
		var table1FirstCaption = table1.caption;
		assert_equals(testCaption, table1FirstCaption);
	}, "createCaption method returns the first caption element child of the table");
	
	test( () {
		var table2 = document.getElementById('table2');
		var test2Caption = table2.createCaption(); 
		var table2FirstNode = table2.firstChild;
		assert_true(test2Caption is  TableCaptionElement);
		assert_equals(table2FirstNode, test2Caption);
	}, "createCaption method creates a new caption and inserts it as the first node of the table element");
	
	test( () {
		var table3 = document.getElementById('table3');
		assert_equals(table3.caption.text, "caption 3");
		table3.deleteCaption();
		assert_equals(table3.caption, null);
	}, "deleteCaption method removes the first caption element child of the table element");
  
    checkTestFailures();
}
