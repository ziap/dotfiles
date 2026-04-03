{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      ExtensionSettings = {
        "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
        # uBlock Origin:
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles = {
      default = {
        id = 0;
        search = {
          default = "ddg";
          force = true;

          # Remove the rest of the search engines
          engines = let
            engines = [ "bing" "google" "amazondotcom-us" "wikipedia" "ebay" ];
            hide = engine: {
              name = engine;
              value = { metaData.hidden = true; };
            };
          in builtins.listToAttrs (map hide engines);
        };
        userChrome = /*css*/ ''
          /* Remove extra buttons and bookmark bar */
          #forward-button,
          #stop-button,
          #reload-button,
          #tracking-protection-icon-container,
          #identity-permission-box,
          #page-action-buttons,
          #toolbar-menubar,
          .titlebar-buttonbox-container,
          .titlebar-spacer,
          #PersonalToolbar {
            display: none !important;
          }

          :root {
            --navbar-width: min(600px, 50%);
          }

          /* Reponsive one-line mode */
          @media (min-width: 1000px) {
            #navigator-toolbox {
              display: flex !important;
              flex-wrap: wrap !important;
              flex-direction: row-reverse !important;
            }

            #nav-bar {
              width: var(--navbar-width) !important;
            }
          }

          #notifications-toolbar {
            width: 100% !important;
          }

          /* Remove navigation bar color */
          #nav-bar {
            background: none !important;
          }

          /* Remove new tab icon */
          .tabbrowser-tab[label="New Tab"]:not([pinned]) .tab-icon-image {
            display: none !important;
          }
        '';

        settings = {
          # Disable startup page and new tab
          "browser.startup.page" = 0;
          "browser.startup.homepage" = "about:blank";
          "browser.newtabpage.enabled" = false;

          # Enable userChrome.css
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          # Disable pinned sites and bookmarks
          "browser.toolbars.bookmarks.visibility" = "never";

          # Force locale
          "browser.search.region" = "US";
          "general.useragent.locale" = "en-US";

          # Disable sponsored + topsites
          "browser.topsites.component.enabled" = false;
          "browser.topsites.contile.enabled" = false;
          "browser.topsites.useRemoteSetting" = false;

          # Clear history when shut down
          "privacy.sanitize.sanitizeOnShutdown" = true;
          "privacy.clearOnShutdown.cache" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.sessions" = false;

          # Enable HTTPS only
          "dom.security.https_only_mode" = true;
          "dom.security.https_only_mode_ever_enabled" = true;
          "dom.security.https_only_mode_send_http_background_request" = false;

          # Enable DNS over HTTPS
          "network.trr.mode" = 2;

          # Disable system geolocation
          "geo.provider.ms-windows-location" = false; # [WINDOWS]
          "geo.provider.use_corelocation" = false; # [MAC]
          "geo.provider.use_geoclue" = false; # [FF102+] [LINUX]

          # Disable telemetry
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;

          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "data:,";
          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.newProfilePing.enabled" = false;
          "toolkit.telemetry.shutdownPingSender.enabled" = false;
          "toolkit.telemetry.updatePing.enabled" = false;
          "toolkit.telemetry.bhrPing.enabled" = false;
          "toolkit.telemetry.firstShutdownPing.enabled" = false;
          "toolkit.telemetry.coverage.opt-out" = true;
          "toolkit.coverage.opt-out" = true;
          "toolkit.coverage.endpoint.base" = "";

          "browser.ping-centre.telemetry" = false;

          "app.shield.optoutstudies.enabled" = false;
          "app.normandy.enabled" = false;
          "app.normandy.api_url" = "";

          # Disable crash report
          "breakpad.reportURL" = "";
          "browser.tabs.crashReporting.sendReport" = false;

          # Disable network prefetching
          "network.prefetch-next" = false;
          "network.dns.disablePrefetch" = true;
          "network.predictor.enabled" = false;
          "network.predictor.enable-prefetch" = false;
          "network.http.speculative-parallel-limit" = 0;
          "browser.places.speculativeConnect.enabled" = false;

          # Disable IPv6
          "network.dns.disableIPv6" = true;

          # Disable some url bar suggestion
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.topsites" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.searches" = true; # Still enable search suggestion
          "browser.urlbar.speculativeConnect.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false; # [FF95+]
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;

          # Ask user where to save file and other download settings
          "browser.download.useDownloadDir" = false;
          "browser.download.alwaysOpenPanel" = false;
          "browser.download.manager.addToRecentDocs" = false;

          # Tracking protection
          "privacy.donottrackheader.enabled" = true;
          "network.http.referer.disallowCrossSiteRelaxingDefault" = true;
          "network.http.referer.disallowCrossSiteRelaxingDefault.top_navigation" = true; # [FF100+]
          "privacy.partition.network_state.ocsp_cache" = true;
          "privacy.query_stripping.enabled" = true; # [FF101+] [ETP FF102+]
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.annotate_channels.strict_list.enabled" = true;
        };
      };
    };
  };
}
