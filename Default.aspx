<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Web" %>
<script runat="server">
  protected void Page_Load(object sender, EventArgs e)
  {
    Os.Text = Environment.OSVersion.ToString();
    Machine.Text = Environment.MachineName;
    Clr.Text = Environment.Version.ToString();
    Port.Text = Environment.GetEnvironmentVariable("PORT") ?? "(unset)";
    Idx.Text = Environment.GetEnvironmentVariable("CF_INSTANCE_INDEX") ?? "n/a";
    Ip.Text = Environment.GetEnvironmentVariable("CF_INSTANCE_IP") ?? "n/a";
    Soft.Text = Request.ServerVariables["SERVER_SOFTWARE"] ?? "(unknown)";
    Utc.Text = DateTime.UtcNow.ToString("o");
  }
</script>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Hello from HWC on Windows Diego</title>
  <style>
    :root { color-scheme: dark; }
    body {
      margin: 0; min-height: 100vh;
      font-family: "Segoe UI", system-ui, sans-serif;
      background: #1a1024;
      color: #f4eef8;
      display: grid; place-items: center;
    }
    main {
      max-width: 48rem; padding: 2.2rem;
      background: #2a1840; border-radius: 16px;
      box-shadow: 0 20px 50px rgba(0,0,0,.35);
      border-top: 6px solid #b388ff;
    }
    h1 { margin: 0 0 .4rem; font-size: 1.8rem; }
    p { color: #d4c4e8; line-height: 1.5; }
    a { color: #d4b3ff; }
    ul { color: #d4c4e8; line-height: 1.45; }
    dl { display: grid; grid-template-columns: 10rem 1fr; gap: .45rem .8rem; margin: 1.2rem 0 0; }
    dt { color: #d4b3ff; font-size: .82rem; text-transform: uppercase; letter-spacing: .04em; }
    dd { margin: 0; font-family: Consolas, ui-monospace, monospace; }
    .ok { color: #ce93d8; font-weight: 600; }
  </style>
</head>
<body>
  <main>
    <h1>Hello, HWC buildpack</h1>
    <p class="ok">This is a .NET Framework ASP.NET page hosted by IIS Hosted Web Core on a Windows Diego cell.</p>
    <p>Why <code>hwc_buildpack</code> instead of <code>binary_buildpack</code>?</p>
    <ul>
      <li><strong>HWC</strong> is for IIS-shaped apps: <code>Web.config</code>, ASPX, System.Web, URL Rewrite, IIS modules. The buildpack starts <code>hwc.exe</code>, binds <code>PORT</code>, and serves the site. You do not ship a process EXE or a start command.</li>
      <li><strong>Binary</strong> is for a process you already built — like <a href="https://hello-windows.homelab1.fynesy.com">hello-windows</a>, a self-contained ASP.NET Core Kestrel <code>.exe</code>. The binary pack does not compile, does not run IIS, and needs <code>command:</code> in the manifest.</li>
      <li>Use HWC when the app is classic ASP.NET on the Windows stemcell. Use binary (or Linux <code>dotnet_core_buildpack</code>) when the app is ASP.NET Core / Kestrel.</li>
    </ul>
    <p>Companions:
      <a href="https://hello-windows.homelab1.fynesy.com">hello-windows</a> (binary + Kestrel) ·
      <a href="https://hello-dotnet-core.homelab1.fynesy.com">hello-dotnet-core</a> (Linux cells)
    </p>
    <dl>
      <dt>SERVER_SOFTWARE</dt><dd><asp:Literal ID="Soft" runat="server" /></dd>
      <dt>OS</dt><dd><asp:Literal ID="Os" runat="server" /></dd>
      <dt>CLR</dt><dd><asp:Literal ID="Clr" runat="server" /></dd>
      <dt>Machine</dt><dd><asp:Literal ID="Machine" runat="server" /></dd>
      <dt>CF instance</dt><dd><asp:Literal ID="Idx" runat="server" /> @ <asp:Literal ID="Ip" runat="server" /></dd>
      <dt>PORT</dt><dd><asp:Literal ID="Port" runat="server" /></dd>
      <dt>Time (UTC)</dt><dd><asp:Literal ID="Utc" runat="server" /></dd>
    </dl>
  </main>
</body>
</html>
