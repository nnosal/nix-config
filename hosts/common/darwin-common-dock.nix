{ config, ... }:
{
  system.defaults.dock = {
    persistent-apps = [
      "/Applications/Google Chrome.app"
      "/Applications/Signal.app"
      "/Applications/Discord.app"
      "/Applications/Slack.app"
      "/Applications/Notion.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/Ghostty.app"
    ];
  };
}
