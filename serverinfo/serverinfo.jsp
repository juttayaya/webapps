<%--
    Author: Jirawat Uttayaya (admin@apps.jirawat.com)

    Version: 1.0.0

    Purpose:
        serverinfo.jsp retrieves JEE server and http request information to aid in debugging.
        Add it anywhere in the web application and access it from a web browser to see the server info.

        To make it easy to deploy, I put everything into one JSP.

        I used static member classes so it will be easier to read and modify the code
        in one place instead of everywhere in the JSP.

        I restricted to use only the Java 1.4 API so it will work on older J2EE app servers
--%>

<%@ page
        language="java"
        session="false"
        isThreadSafe="true"
        isErrorPage="false"
        autoFlush="true"
        buffer="none"
        import="javax.naming.*,
                java.util.*,
                java.io.*,
                java.net.InetAddress"
        %>
<html>
<head>
    <title>JEE Server Info</title>
    <style>
            /* Style for serverinfo tables*/
        table.serverinfo {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            font-size: 16px;
            margin: 21px;
            width: 480px;
            text-align: left;
            border-collapse: collapse;
            border: 1px solid #69c;
        }

        th.serverinfo {
            padding: 12px 19px 12px 19px;
            font-weight: normal;
            font-size: 20px;
            color: #000;
            background: #b9c9fe;

        }

        td.serverinfokey {
            padding: 7px 7px 7px 7px;
            color: #000;
            font-weight: bold;
            border-bottom: 1px solid #69c;
        }

        td.serverinfovalue {
            color: #339;
            border-bottom: 1px solid #69c;
        }

        tr:hover.serverinfo td.serverinfokey {
            background: #e8edff;
        }

        tr:hover.serverinfo td.serverinfovalue {
            background: #e8edff;
        }


    </style>
</head>
<body>
<%
    // Get Info about the server network configuration
    final ServerInfo serverNetworkInfo = new ServerNetworkInfo(request);
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= serverNetworkInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = serverNetworkInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

<%
    // Get Info about the server memory consumption
    final ServerInfo memoryInfo = new MemoryInfo();
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= memoryInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = memoryInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>


<%
    // Get info about Java system properties
    final ServerInfo systemPropertiesInfo = new SystemPropertiesInfo();
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= systemPropertiesInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = systemPropertiesInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

<%
    // Get info about HTTPServletRequest Object
    final ServerInfo httpRequestInfo = new HttpRequestInfo(request);
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= httpRequestInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = httpRequestInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

<%
    // Get info about HTTP Headers
    final ServerInfo httpHeaderInfo = new HttpHeaderInfo(request);
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= httpHeaderInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = httpHeaderInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

<%
    // Get info about HTTP Session
    final ServerInfo httpSessionInfo = new HttpSessionInfo(request);
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= httpSessionInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = httpSessionInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

<%
    // Get info about HTTP Cookie
    final ServerInfo cookieInfo = new CookieInfo(request);
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= cookieInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = cookieInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

<%
    // Get info about Application Servlet Context
    final ServerInfo ctxInfo = new ServletContextInfo(application);
%>
<table class="serverinfo">
    <thead>
    <tr>
        <th colspan="2" class="serverinfo" scope="colgroup"><%= ctxInfo.getHeader() %>
        </th>
    </tr>
    </thead>
    <tbody>
    <% for (final Iterator infoIter = ctxInfo.getAllInfo().iterator(); infoIter.hasNext(); ) {
        final Map.Entry infoEntry = (Map.Entry) infoIter.next();
    %>
    <tr class="serverinfo">
        <td class="serverinfokey"><%= infoEntry.getKey() %>
        </td>
        <td class="serverinfovalue"><%= infoEntry.getValue() %>
        </td>
    </tr>
    <% } %>

    </tbody>
</table>

</body>
</html>

<%!
    // Utility Classes for ServerInfo
    abstract static class ServerInfo {
        private final String header;
        private final Map infoMap = new LinkedHashMap();

        /**
         *
         * @param hdr The header or title of the server info that will be returned by getHeader()
         */
        protected ServerInfo(final String hdr) {
            this.header = hdr;
        }

        /**
         * Initialize the server info to be displayed
         */
        abstract protected void initInfo();

        public String getHeader() {
            return this.header;
        }

        protected void addInfo(final String key, final String value) {
            infoMap.put(key, value);
        }

        /**
         * Get all the server info added via addInfo method
         *
         * @return A Set of Map.Entry
         */
        public Set getAllInfo() {
            return Collections.unmodifiableSet(infoMap.entrySet());
        }

    }

    static final class ServerNetworkInfo extends ServerInfo {
        private final HttpServletRequest request;

        private ServerNetworkInfo(final HttpServletRequest req) {
            super("Server Network Info");
            this.request = req;
            initInfo();
        }

        protected void initInfo() {
            addInfo("IP", getServerIP());
            addInfo("Host Name", getServerName());
            addInfo("Port", String.valueOf(this.request.getLocalPort()));
            addInfo("Date Time", new Date().toString());
        }

        private String getServerIP() {
            try {
                final InetAddress inetAddr = InetAddress.getLocalHost();
                final StringBuffer sb = new StringBuffer(128);
                sb.append(this.request.getLocalAddr()).append(" ( ");
                sb.append(inetAddr.getHostAddress()).append(" ) ");
                return sb.toString();

            } catch (Exception e) {
                return "Error: " + e.getMessage();
            }
        }


        private String getServerName() {
            try {
                final InetAddress inetAddr = InetAddress.getLocalHost();
                final StringBuffer sb = new StringBuffer(128);
                sb.append(this.request.getLocalName()).append(" ( ");
                sb.append(inetAddr.getHostName()).append(" ) ");
                return sb.toString();


            } catch (Exception e) {
                return "Error: " + e.getMessage();
            }

        }
    }

    static final class MemoryInfo extends ServerInfo {
        MemoryInfo() {
            super("Server CPU and Memory");
            initInfo();
        }

        protected void initInfo() {
            final Runtime rt = Runtime.getRuntime();
            final long cpu = rt.availableProcessors();
            final long freeMem = rt.freeMemory();
            final long totalMem = rt.totalMemory();
            final long usedMem = totalMem - freeMem;
            final long maxMem = rt.maxMemory();

            final int freeMB = (int) freeMem / 1000000;
            final int totalMB = (int) totalMem / 1000000;
            final int usedMB = (int) usedMem / 1000000;
            final int maxMB = (int) maxMem / 1000000;

            addInfo("CPU #" , String.valueOf(cpu));
            addInfo("Used", usedMem + " bytes ( " + usedMB + " MB )");
            addInfo("Free", freeMem + " bytes ( " + freeMB + " MB )");
            addInfo("Total", totalMem + " bytes ( " + totalMB + " MB )");
            addInfo("Max", maxMem + " bytes ( " + maxMB + " MB )");
        }
    }


    static final class SystemPropertiesInfo extends ServerInfo {
        SystemPropertiesInfo() {
            super("Java System Properties");
            initInfo();
        }

        protected void initInfo() {
            final Properties props = System.getProperties();
            final Set propsSet = new TreeSet(props.keySet());

            for (final Iterator it = propsSet.iterator(); it.hasNext(); ) {
                final String key = (String) it.next();
                final String value = props.getProperty(key);
                addInfo(key, value);
            }
        }

    }


    static final class HttpRequestInfo extends ServerInfo {
        private final HttpServletRequest request;

        HttpRequestInfo(final HttpServletRequest req) {
            super("HTTP Request Info");
            this.request = req;
            initInfo();
        }

        protected void initInfo() {
            addHTTPRequestInfo();
        }

        private void addHTTPRequestInfo() {
            addInfo("Auth Type", this.request.getAuthType());
            addInfo("Character Encoding", this.request.getCharacterEncoding());
            addInfo("Content Length", String.valueOf(this.request.getContentLength()));
            addInfo("Content Type", this.request.getContentType());
            addInfo("Context Path", this.request.getContextPath());
            addInfo("isSecure", String.valueOf(this.request.isSecure()));
            addInfo("Local Addr", this.request.getLocalAddr());
            addInfo("Local Name", this.request.getLocalName());
            addInfo("Local Port", String.valueOf(this.request.getLocalPort()));
            addInfo("Locale", String.valueOf(this.request.getLocale()));
            addInfo("Locales", getLocalesString());
            addInfo("Method", this.request.getMethod());
            addInfo("Path Info", this.request.getPathInfo());
            addInfo("Path Translated", this.request.getPathTranslated());
            addInfo("Protocol", this.request.getProtocol());
            addInfo("Query String", this.request.getQueryString());
            addInfo("Remote Addr", this.request.getRemoteAddr());
            // getRemoteHost() method takes really long in WebSphere 6.1 with a slow DNS
            // like the lab.
            // addInfo("RemoteHost",   this.request.getRemoteHost() );
            addInfo("Remote Port", String.valueOf(this.request.getRemotePort()));
            addInfo("Request URI", this.request.getRequestURI());
            addInfo("Request URL", this.request.getRequestURL().toString());
            addInfo("Remote User", this.request.getRemoteUser());
            addInfo("Scheme", this.request.getScheme());
            addInfo("Server Name", this.request.getServerName());
            addInfo("Server Port", String.valueOf(this.request.getServerPort()));
            addInfo("Servlet Path", this.request.getServletPath());
            addInfo("User Principal", String.valueOf(this.request.getUserPrincipal()));
        }

        private String getLocalesString() {
            final Enumeration attrEnum = this.request.getLocales();
            return FormatHelper.format(attrEnum);
        }

    }

    static final class HttpHeaderInfo extends ServerInfo {
        private final HttpServletRequest request;

        HttpHeaderInfo(final HttpServletRequest req) {
            super("HTTP Headers");
            this.request = req;
            initInfo();
        }

        protected void initInfo() {
            final Enumeration headEnum = this.request.getHeaderNames();
            while (headEnum.hasMoreElements()) {
                String headName = (String) headEnum.nextElement();
                String headVal = this.request.getHeader(headName);
                addInfo(headName, headVal);
            }

        }
    }

    static final class HttpSessionInfo extends ServerInfo {
        private final HttpServletRequest request;

        HttpSessionInfo(final HttpServletRequest req) {
            super("HTTP Session");
            this.request = req;
            initInfo();
        }

        protected void initInfo() {
            addInfo("Requested Session ID", this.request.getRequestedSessionId());
            addInfo("Is Session Valid", String.valueOf(this.request.isRequestedSessionIdValid()));
            addInfo("Is Session From Cookie", String.valueOf(this.request.isRequestedSessionIdFromCookie()));
            addInfo("Is Session From URL", String.valueOf(this.request.isRequestedSessionIdFromURL()));

            addSessionInfo();
        }

        private void addSessionInfo() {
            final HttpSession sess = this.request.getSession(false);
            if (sess != null) {
                addInfo("ID", sess.getId());
                addInfo("isNew", String.valueOf(sess.isNew()));
                addInfo("Creation Time", new java.util.Date(sess.getCreationTime()).toString());
                addInfo("Last Accessed Time", new java.util.Date(sess.getLastAccessedTime()).toString());
                addInfo("Max Inactive Interval", sess.getMaxInactiveInterval() + " s");

                addSessionAttributesInfo(sess);
            }
        }

        private void addSessionAttributesInfo(final HttpSession session) {
            final StringBuffer sb = new StringBuffer(128);
            sb.append("{");
            final Enumeration attrEnum = session.getAttributeNames();
            int i=0;
            while (attrEnum.hasMoreElements()) {
                String key = (String) attrEnum.nextElement();
                Object value = session.getAttribute(key);
                if (i != 0) {
                    sb.append(", ");
                }
                sb.append("Attr").append(i).append("::");
                sb.append(key).append("=");
                sb.append(FormatHelper.formatObject(value));
                ++i;
            }
            sb.append("}");
            addInfo("Attributes", sb.toString());
        }

    }

    static final class CookieInfo extends ServerInfo {
        private final HttpServletRequest request;

        CookieInfo(final HttpServletRequest req) {
            super("Cookies Info");
            this.request = req;
            initInfo();
        }

        protected void initInfo() {
            final Cookie[] cookies = this.request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; ++i) {
                    final Cookie cookie = cookies[i];
                    addInfo("Cookie " + i + " Name", cookie.getName());
                    addInfo("Cookie " + i + " Value", cookie.getValue());
                    addInfo("Cookie " + i + " Max Age", cookie.getMaxAge() + " s");
                    addInfo("Cookie " + i + " Version", String.valueOf(cookie.getVersion()));
                    addInfo("Cookie " + i + " Domain", cookie.getDomain());
                    addInfo("Cookie " + i + " Path", cookie.getPath());
                    addInfo("Cookie " + i + " Secure Only", String.valueOf(cookie.getSecure()));
                    addInfo("Cookie " + i + " Comment", cookie.getComment());
                    addInfo(" ", " ");
                }
            }

        }
    }
    static final class ServletContextInfo extends ServerInfo {
        private final ServletContext context;

        ServletContextInfo(final ServletContext ctx) {
            super("Application Servlet Context Info");
            this.context = ctx;
            initInfo();
        }

        protected void initInfo() {
            addContextInfo();
            addAttributesInfo();
            addInitParamsInfo();
        }

        private void addContextInfo() {
            addInfo("Context Path", this.context.getContextPath());
            addInfo("Major Version", String.valueOf(this.context.getMajorVersion()));
            addInfo("Minor Version", String.valueOf(this.context.getMinorVersion()));
            addInfo("Server Info", this.context.getServerInfo());
            addInfo("Servlet Context Name", this.context.getServletContextName());
        }

        private void addAttributesInfo() {
            final StringBuffer sb = new StringBuffer(128);
            sb.append("{");
            final Enumeration attrEnum = this.context.getAttributeNames();
            boolean isFirstElement = true;
            while (attrEnum.hasMoreElements()) {
                String key = (String) attrEnum.nextElement();
                Object value = this.context.getAttribute(key);
                if (isFirstElement) {
                    isFirstElement = false;
                } else {
                    sb.append(", ");
                }
                sb.append(key).append("=").append(value);
            }
            sb.append("}");
            addInfo("Attributes", sb.toString());
        }


        private void addInitParamsInfo() {
            final StringBuffer sb = new StringBuffer(128);
            sb.append("{");
            final Enumeration attrEnum = this.context.getInitParameterNames();
            boolean isFirstElement = true;
            while (attrEnum.hasMoreElements()) {
                String key = (String) attrEnum.nextElement();
                Object value = this.context.getAttribute(key);
                if (isFirstElement) {
                    isFirstElement = false;
                } else {
                    sb.append(", ");
                }
                sb.append(key).append("=").append(value);
            }
            sb.append("}");
            addInfo("Init Parameters", sb.toString());
        }

    }

    static final class FormatHelper {
        private FormatHelper() {
        }

        static String formatObject(final Object value) {
            if (value == null) {
                return "null";

            } else if (value.getClass().isArray()) {
                Object[] valueArray = (Object[]) value;
                return format(valueArray);

            } else if (value instanceof Collection) {
                Collection valueColl = (Collection) value;
                return format(valueColl);

            } else if (value instanceof Enumeration) {
                Enumeration valueEnum = (Enumeration) value;
                return format(valueEnum);

            } else if (value instanceof Iterator) {
                Iterator valueIter = (Iterator) value;
                return format(valueIter);

            } else {
                return value.toString();
            }

        }

        static String format(final Object[] valueArray) {
            final StringBuffer sb = new StringBuffer(256);
            sb.append("[");
            for (int i = 0; i < valueArray.length; ++i) {
                if (i != 0) {
                    sb.append(", ");
                }
                sb.append(valueArray[i]);
            }
            sb.append("]");

            return sb.toString();
        }

        static String format(final Collection valueColl) {
            final StringBuffer sb = new StringBuffer(256);
            sb.append(valueColl.getClass().getName()).append("[");
            boolean isFirstElement = true;
            for (Iterator it = valueColl.iterator(); it.hasNext(); ) {
                if (isFirstElement) {
                    isFirstElement = false;
                } else {
                    sb.append(", ");
                }
                sb.append(it.next());
            }
            sb.append("]");

            return sb.toString();

        }

        static String format(final Iterator valueIter) {
            final StringBuffer sb = new StringBuffer(256);
            sb.append(valueIter.getClass().getName()).append("[");
            boolean isFirstElement = true;
            while( valueIter.hasNext() ) {
                if (isFirstElement) {
                    isFirstElement = false;
                } else {
                    sb.append(", ");
                }
                sb.append(valueIter.next());
            }
            sb.append("]");

            return sb.toString();
        }

        static String format(final Enumeration valueEnum) {
            final StringBuffer sb = new StringBuffer(256);
            sb.append(valueEnum.getClass().getName()).append("[");
            boolean isFirstElement = true;
            while (valueEnum.hasMoreElements()) {
                if (isFirstElement) {
                    isFirstElement = false;
                } else {
                    sb.append(", ");
                }
                sb.append(valueEnum.nextElement());
            }
            sb.append("]");

            return sb.toString();

        }

    }

%>


