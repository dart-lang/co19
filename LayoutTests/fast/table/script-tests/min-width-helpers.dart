library min_width_helpers;

import "dart:html";
import "../../../testharness.dart";

String testNotes = """======== General notes ========

The stylesheet used to style the table in each test is available at: 
<a href="$testSuiteRoot/fast/table/resources/min-width.css">LayoutTests/fast/table/resources/min-width.css</a>

Most importantly, note that each table has:
- minimum intrinsic width and height both equal to 100px based on the table content
- maximum intrinsic width and height both equal to 250px based on the table content
- borders and paddings that add up to 30px in both the horizontal and vertical directions
- a parent whose dimensions are 1000px by 1000px

The function signature of computeLogicalWidth is:
void computeLogicalWidth(writingMode, direction, tableStyle)
""";

/* All tables will be generated to have the following intrinsic widths. */
int minIntrinsicLogicalWidth = 100;
int maxIntrinsicLogicalWidth = 250;

/* Tests will cover all permutations of the follow properties and settings. */
List<String> tableTypes = ["html", "css"];
List<String> displays = ["block", "inline"];
List<String> writingModes = ["horizontal", "vertical"];
List<String> directions = ["ltr", "rtl"];
List<Map<String,Object>> logicalWidthsCombinations = [
    /* fixed min-width, auto width */
    {"min-width": "500px", "width": null, "computed-width": {"css": "500px", "html": "470px"}},
    {"min-width": "150px", "width": null, "computed-width": {"css": "250px", "html": "250px"}},
    {"min-width": "50px", "width": null, "computed-width": {"css": "250px", "html": "250px"}},
    /* fixed min-width, fixed width */
    {"min-width": "500px", "width": "600px", "computed-width": {"css": "600px", "html": "570px"}},
    {"min-width": "500px", "width": "400px", "computed-width": {"css": "500px", "html": "470px"}},
    /* fixed min-width, percent width */
    {"min-width": "500px", "width": "60%", "computed-width": {"css": "600px", "html": "570px"}},
    {"min-width": "500px", "width": "40%", "computed-width": {"css": "500px", "html": "470px"}},
    /* percent min-width, auto width */
    {"min-width": "50%", "width": null, "computed-width": {"css": "500px", "html": "470px"}},
    {"min-width": "15%", "width": null, "computed-width": {"css": "250px", "html": "250px"}},
    {"min-width": "5%", "width": null, "computed-width": {"css": "250px", "html": "250px"}},
    /* percent min-width, fixed width */
    {"min-width": "50%", "width": "600px", "computed-width": {"css": "600px", "html": "570px"}},
    {"min-width": "50%", "width": "400px", "computed-width": {"css": "500px", "html": "470px"}},
     /* percent min-width, percent width */
    {"min-width": "50%", "width": "60%", "computed-width": {"css": "600px", "html": "570px"}},
    {"min-width": "50%", "width": "40%", "computed-width": {"css": "500px", "html": "470px"}},
     /* auto min-width (shouldn't affect anything), auto width */
    {"min-width": "auto", "width": null, "computed-width": {"css": "250px", "html": "250px"}},
];

void runTests(tableType, computeLogicalWidth) {
    debug(testNotes);

    writingModes.forEach((writingMode) {
        debug("======== Test $writingMode writing mode ========");

        directions.forEach((direction) {
            debug("--------- Test $direction direction ---------");

            logicalWidthsCombinations.forEach((logicalWidthsCombination) {
                var tableStyle = createTableStyle(writingMode, logicalWidthsCombination);
                shouldBe(computeLogicalWidth(writingMode, direction, tableStyle),
                      (logicalWidthsCombination["computed-width"] as Map)[tableType],
                      logicalWidthsCombination.toString());
            });

            debug("");
        });
    });
}

String createTableStyle(writingMode, logicalWidthsCombination) {
    String widthStyle = "";

    var logicalWidthName = (writingMode == "vertical" ? "height" : "width");

    if (logicalWidthsCombination["width"] != null)
        widthStyle += "$logicalWidthName: ${logicalWidthsCombination['width']}; ";

    if (logicalWidthsCombination["min-width"] != null)
        widthStyle += "min-$logicalWidthName: ${logicalWidthsCombination['min-width']};";

    return widthStyle;
}

String computeLogicalWidthHelper(tableType, display, writingMode, direction, tableStyle) {
    var isCSSTable = (tableType == "css");
    var tableClass = "$display $writingMode $direction";

    var tableParent = document.createElement("div");
    tableParent.setAttribute("class", "table-parent");
    document.body.append(tableParent);

    var table = document.createElement(isCSSTable ? "div" : "table");
    table.setAttribute("class", tableClass);
    table.setAttribute("style", tableStyle);
    tableParent.append(table);

    var rowGroup = document.createElement(isCSSTable ? "div" : "tbody");
    rowGroup.setAttribute("class", "row-group");
    table.append(rowGroup);

    var row = document.createElement(isCSSTable ? "div" : "tr");
    row.setAttribute("class", "row");
    rowGroup.append(row);

    var cell = document.createElement(isCSSTable ? "div" : "td");
    cell.setAttribute("class", "cell");
    row.append(cell);

    // Create as many spans of width equal to minIntrinsicLogicalWidth without exceeding maxIntrinsicLogicalWidth.
    var remainingLogicalWidth;
    for (remainingLogicalWidth = maxIntrinsicLogicalWidth; remainingLogicalWidth >= minIntrinsicLogicalWidth; remainingLogicalWidth -= minIntrinsicLogicalWidth) {
        Element span = createSpan(minIntrinsicLogicalWidth);
        cell.append(span);
    }

    // Create a span of width < minIntrinsicLogicalWidth for any remaining width.
    if (remainingLogicalWidth > 0) {
        Element span = createSpan(remainingLogicalWidth);
        cell.append(span);
    }

    String logicalWidthPropertyName = (writingMode == "vertical" ? "height" : "width");
    var computedLogicalWidth = table.getComputedStyle(null).getPropertyValue(logicalWidthPropertyName);

    tableParent.remove();

    return computedLogicalWidth;
}

Element createSpan(logicalWidth) {
    Element span = document.createElement("span");
    span.setAttribute("style",
                     "display: inline-block; width: ${logicalWidth}px; height: ${logicalWidth}px; background-color: #f00;");
    return span;
}
