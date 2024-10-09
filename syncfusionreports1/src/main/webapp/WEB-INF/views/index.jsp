<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Syncfusion Dashboard</title>
    <link href="https://cdn.syncfusion.com/ej2/21.2.3/tailwind.css" rel="stylesheet"/>
    <script src="https://recruitlycdn.com/js/syncfusion/ej2/dist/ej2.min.js" type="text/javascript"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-excel-export/dist/global/ej2-excel-export.global.min.js"></script>
    <script src="https://cdn.syncfusion.com/ej2/ej2-pdf-export/dist/global/ej2-pdf-export.global.min.js"></script>
</head>
<body>
<h2>Report Dashboard</h2>

<form action="/reports" method="post">
    <input type="text" name="title" placeholder="Title" required>
    <input type="text" name="description" placeholder="Description" required>
    <input type="number" name="value" placeholder="Value" required>
    <button type="submit">Add Report</button>
</form>

<div id="Grid"></div>

<script>
    var syncfusionLicenseKey = "Ngo9BigBOggjHTQxAR8/V1NDaF5cWWtCf1JpTXxbf1x0ZFZMYlhbRH5PMyBoS35RckRjWXZec3ZRR2BbWUd2";
    ej.base.registerLicense(syncfusionLicenseKey);

    var reports = ${reports}; // Use JSP to inject reports

    var grid = new ej.grids.Grid({
        dataSource: reports,
        allowPaging: true,
        columns: [
            { field: 'id', headerText: 'ID', width: 120, textAlign: 'Right' },
            { field: 'title', headerText: 'Title', width: 150 },
            { field: 'description', headerText: 'Description', width: 200 },
            { field: 'value', headerText: 'Value', width: 120, textAlign: 'Right' }
        ]
    });
    grid.appendTo('#Grid');
</script>
</body>
</html>
