<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Available Reports</title>
    <link href="https://cdn.syncfusion.com/ej2/21.2.3/tailwind.css" rel="stylesheet" />
</head>
<body>
<h2>Available Reports</h2>
<div id="reportsGrid"></div>

<script>
    fetch('/api/reports')
        .then(response => response.json())
        .then(data => {
            var grid = new ej.grids.Grid({
                dataSource: data,
                allowPaging: true,
                columns: [
                    { field: 'title', headerText: 'Title', width: 150 },
                    { field: 'description', headerText: 'Description', width: 200 },
                    { field: 'value', headerText: 'Value', width: 100 },
                    {
                        headerText: 'Actions', width: 150, template: '<button onclick="deleteReport(this)">Delete</button>'
                    }
                ]
            });
            grid.appendTo('#reportsGrid');
        });

    function deleteReport(element) {
        const row = element.closest('tr');
        const reportId = row.getAttribute('data-id');

        fetch('/api/reports/' + reportId, {
            method: 'DELETE',
        })
            .then(response => {
                if (response.ok) {
                    swal("Deleted!", "Report has been deleted.", "success");
                    row.remove();
                } else {
                    swal("Error!", "Failed to delete report.", "error");
                }
            });
    }
</script>
</body>
</html>
