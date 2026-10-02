<%@ Page Language="C#" ContentType="application/json" %>
<%@ Import Namespace="System" %>
<script runat="server">
  protected void Page_Load(object sender, EventArgs e)
  {
    Response.Cache.SetCacheability(HttpCacheability.NoCache);
    var json = "{\"ok\":true,\"host\":\"hwc\",\"clr\":\"" + Environment.Version +
      "\",\"windows\":true,\"server\":\"" +
      (Request.ServerVariables["SERVER_SOFTWARE"] ?? "").Replace("\"", "") + "\"}";
    Response.Write(json);
    Response.End();
  }
</script>
