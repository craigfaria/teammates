<%@ page import="java.util.Date" %>
<%@ page import="org.joda.time.DateTimeZone" %>
<%@ page import="teammates.common.util.FrontEndLibrary" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TEAMMATES - Timezone Compilation</title>
    </head>
    <body>
        <table>
            <tr>
                <td id="jodatime">
                    <% 
                    long date = new Date().getTime();
                    for (String timeZone: DateTimeZone.getAvailableIDs()) {
                        int offset = DateTimeZone.forID(timeZone).getOffset(date) / 60 / 1000; %>
                        <%= timeZone %> <%= offset %><br>
                    <% } %>
                </td>
                <td id="momentjs"></td>
            </tr>
        </table>
        <script type="text/javascript" src="<%= FrontEndLibrary.JQUERY.getLibrarySource() %>"></script>
        <script type="text/javascript" src="<%= FrontEndLibrary.MOMENT.getLibrarySource() %>"></script>
        <script type="text/javascript" src="<%= FrontEndLibrary.MOMENT_TIMEZONE.getLibrarySource() %>"></script>
        <script>
            var d = new Date();
            moment.tz.names().forEach(function(timeZone) {
                var offset = moment.tz.zone(timeZone).offset(d) * -1;
                $('#momentjs').append(timeZone + ' ' + offset + '<br>');
            });
        </script>
    </body>
</html>