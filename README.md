# hello-hwc

Classic ASP.NET (.NET Framework) demo for **homelab1.fynesy.com** Windows Diego cells using **`hwc_buildpack`**.

Companion to [hello-windows](https://hello-windows.homelab1.fynesy.com) (`binary_buildpack` + Kestrel) and [hello-dotnet-core](https://hello-dotnet-core.homelab1.fynesy.com) (Linux `dotnet_core_buildpack`).

HWC hosts IIS Hosted Web Core. Push a site with `Web.config` — do not set `command:` to an `.exe`.

```bash
cf target -o hermes -s hermes
cf push -f manifest.yml -p .
```

Route: https://hello-hwc.homelab1.fynesy.com
