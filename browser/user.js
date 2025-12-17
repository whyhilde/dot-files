// general options

// customization browser using css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// enable browser tools
user_pref("devtools.chrome.enabled", true);
user_pref("devtools.debugger.remote-enabled", true);

// integrated calculator in urlbar
user_pref("browser.urlbar.suggest.calculator", true);

// set homepage
user_pref("browser.startup.homepage", "about:home");


// convenience

// hide tooltips in toolbar
user_pref("browser.chrome.toolbar_tips", false);

// show new tab button on top
user_pref("zen.view.show-newtab-button-top", true);

// disable link previews on tabs
user_pref("browser.tabs.hoverPreview.enabled", false);

// disable check default browser
user_pref("browser.shell.checkDefaultBrowser", false);

// disable animation of opening video on full screen and prompt "press esc.."
user_pref("full-screen-api.transition-duration.enter", "0");
user_pref("full-screen-api.transition-duration.leave", "0");
user_pref("full-screen-api.warning.timeout", 0);


// privacy

// disable Pocket
user_pref("extensions.pocket.api", "");
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.site", "");
user_pref("extensions.pocket.oAuthConsumerKey", "");

// disable site tracking
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.donottrackheader.enabled", true);

// disable telemetry and sending reports
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.previousBuildID", "");
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server_owner", "");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.policy.firstRunURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.tabs.crashReporting.email", false);
user_pref("browser.tabs.crashReporting.emailMe", false);
user_pref("breakpad.reportURL", "");
user_pref("security.ssl.errorReporting.automatic", false);
user_pref("toolkit.crashreporter.infoURL", "");
user_pref("network.allow-experiments", false);
user_pref("dom.ipc.plugins.reportCrashURL", false);
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
