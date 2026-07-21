{lib, ...}:{
programs.equibop = {
  enable = true;

  # AttrSet of (strings concat with "\n" or abs path)
  # Can be enabled by setting programs.equibop.equicord.settings.enabledThemes to ["THEME_NAME.css"]
  equicord.themes = {
  	"XCX" = ../../assets/pyrite.theme.css;
    };


  equicord.settings = {
    autoUpdate = false;
    autoUpdateNotification = false;
    disableMinSize = true;
    notifyAboutUpdates = false;
    enabledThemes = [ "XCX.css" ];
    plugins = {

        MessageLoggerEnhanced = {
            enabled = true;
            ignoreSelf = true;
        };
    } // lib.genAttrs
    # Plugins that are simple enables
    [
        "FakeNitro"

        "BetterAudioPlayer"
        "BetterCommands"
        "BetterForwards"
        "BetterInvites"
        "BetterPlusReacts"
        "BetterRoleContext"
        "BetterSettings"
        "ClickableRoles"
        "CopyUserMention"
        "CrashHandler"
        "CustomFolderIcons"
        "DontRoundMyTimestamps"
        "DownloadAllAttachments"
        "Dragify"
        "FixCodeblockGap"
        "FixImagesQuality"
        "ForceOwnerCrown"
        "GameActivityToggle"
        "GitHubRepos"
        "HomeTyping"
        "KeyboardNavigation"
        "LoadingsQuotes"
        "MarkdownTables"
        "MentionAvatars"
        "MessageBurst"
        "MessagePeek"
        "MusicControls"
        "NewPluingsManager"
        "QuickReply"
        "Quoter"
        "RevealAllSpoilers"
        "RoleColorEverywhere"
        "SekaiStickers"
        "SendTimestamps"
        "ShowConnections"
        "ShowMeYourName"
        "SplitLargeMessages"
        "SteamStatusSync"
        "TypingIndicator"
        "TypingTweaks"
        "Unindent"
        "UniversalMention"
        "UserMessagesPronouns"
        "UserVoiceShow"
        "ValidReply"
        "ValidUser"
        "ViewIcons"
        "WebKeybinds"
        "WebScreenShareFixes"
        "WhoReacted"
        "ZipPreview"

        # Commands
        "MoreCommands"
        "CommandPalette"
        "CustomCommands"
        "GoogleThat"

        # Z-A
        "YoutubeAdblock"
        "WigglyText"
        "WhosWatching"
        "VolumeBooster"
        "VoiceStats"
        "VoiceMessages"
        "VoiceChatUtilities"
        "VoiceChannelLog"
        "VoiceButtons"
        "VCPanelSettings"
        "ToneIndicators"
        "Timezones"
        "Streaks"
        "StopAutoUnread"
        "ShikiCodeblocks"
        "ServerSearch"
        "ServerInfo"
        "SedEnhanced"
        "RPCEditor"
        "ReverseImageSearch"
        "ReplaceGoogleSearch"
        "RelationshipNotifier"
        "RecentDMSwitcher"
        "ReadAllNotifications"
        "QuickMention"
        "PreviewMessage"
        "PermissionsViewer"
        "PetPet"
        "PermissionFreeWill"
        "OpenInApp"
        "OnePingPerDM"
        "NoTypingAnimation"
        "NoOnboardingDelay"
        "NoNitroUpsell"
        "NoF1"
        "MoreStickers"
        "MoreQuickReactions"
        "MessageColors"
        "MemberCount"
        "InRole"
        "ImplicitRelationships"
        "FullVCPFP"
        "FullUserInChatbox"
        "FriendTags"
        "FullSearchContext"
        "FriendshipRanks"
        "FixYoutubeEmbeds"
        "FixFileExtensions"
        "EquibopStreamFixes"
        "Declutter"
        "Dearrow"
        "CustomTimestamps"
        "CopyFileContents"
        "CharacterCounter"
        "CallTimer"
        "BetterUploadButton"
        "BetterFolders"
        "AutoZipper"
        "AlwaysTrust"
    ]
    (name: {enabled = true;});
  };
};
}
