class Conferences::API < Grape::API
  version "v1", using: :header, vendor: "conferences"
  format :json
  prefix :api

  helpers do
    def current_user
      @current_user ||= env["warden"].user
    end

    def authenticate!
      error!("401 Unauthorized", 401) unless current_user
    end
  end

  resource "classroom" do
    desc "Return the classroom configuration."
    get :config do
      authenticate!
      {
        generell: {
          domain: "meet.agil-verwirklichen.de",
        },
        options: {
          userInfo: {
            email: current_user.try(&:email),
            displayName: [current_user.try(&:first_name), current_user.try(&:surname)].join(" "),
          },
          interfaceConfigOverwrite: {
            # https:# github.com/jitsi/jitsi-meet/blob/master/interface_config.js
            # DEFAULT_BACKGROUND: '#ffffff',
            filmStripOnly: false,
            INITIAL_TOOLBAR_TIMEOUT: 20000000,
            TOOLBAR_TIMEOUT: 4000000,
            DISABLE_VIDEO_BACKGROUND: true,
            TOOLBAR_ALWAYS_VISIBLE: true,
            # DEFAULT_REMOTE_DISPLAY_NAME: "",
            DEFAULT_WELCOME_PAGE_LOGO_URL: '',
            DEFAULT_LOCAL_DISPLAY_NAME: "Ich",
            DEFAULT_LOGO_URL: '',
            SHOW_JITSI_WATERMARK: false,
            SHOW_POWERED_BY: false,
            SHOW_DEEP_LINKING_IMAGE: false,
            SHOW_PROMOTIONAL_CLOSE_PAGE: false,
            GENERATE_ROOMNAMES_ON_WELCOME_PAGE: true,
            DISPLAY_WELCOME_PAGE_CONTENT: true,
            DISPLAY_WELCOME_PAGE_TOOLBAR_ADDITIONAL_CONTENT: false,

            DISABLE_DOMINANT_SPEAKER_INDICATOR: false,
            DISABLE_FOCUS_INDICATOR: false,
            
            APP_NAME: "Klassenraum",
        
            AUDIO_LEVEL_PRIMARY_COLOR: 'rgba(255,255,255,0.4)',
            AUDIO_LEVEL_SECONDARY_COLOR: 'rgba(255,255,255,0.2)',

            DISPLAY_WELCOME_FOOTER: true,
            DISPLAY_WELCOME_PAGE_ADDITIONAL_CARD: false,
            DISPLAY_WELCOME_PAGE_CONTENT: false,
            DISPLAY_WELCOME_PAGE_TOOLBAR_ADDITIONAL_CONTENT: false,

            HIDE_DEEP_LINKING_LOGO: false,
            HIDE_INVITE_MORE_HEADER: false,

            ENABLE_DIAL_OUT: true,
            ENABLE_FEEDBACK_ANIMATION: false, # Enables feedback star animation.
            FILM_STRIP_MAX_HEIGHT: 120,
            
            NATIVE_APP_NAME: "Jitsi Meet",
            POLICY_LOGO: false,
            PROVIDER_NAME: "Agil verWirklichen",
            LANG_DETECTION: true, #  Allow i18n to detect the system language
            LIVE_STREAMING_HELP_LINK: 'https://jitsi.org/live', # Documentation reference for the live streaming feature.
            # LOCAL_THUMBNAIL_RATIO: 16 / 9, # 16:9
            INVITATION_POWERED_BY: true,
            AUTHENTICATION_ENABLE: false,
            VERTICAL_FILMSTRIP: true,
            VIDEO_LAYOUT_FIT: "both",
            TILE_VIEW_MAX_COLUMNS: 5,
            TOOLBAR_BUTTONS: [

            ], 
            #  'raisehand' 'livestreaming', 'etherpad', 'sharedvideo', 'settings',
            #  'filmstrip', 'invite', 'feedback', 'stats',
            #  'videobackgroundblur', 'download', 'help',
            #  'e2ee', 'recording', 'info', 'calendar'
            #              "microphone", "camera", "closedcaptions", "desktop", "fullscreen", "videobackgroundblur", "videoquality",
            #  "fodeviceselection", "hangup", "profile", "chat", "shortcuts", "tileview", "mute-everyone",

            SETTINGS_SECTIONS: ["devices", "language", "moderator", "profile"],
            # [ 'devices', 'language', 'moderator', 'profile', 'calendar' ],

            UNSUPPORTED_BROWSERS: [],
            OPTIMAL_BROWSERS: [ 'chrome', 'chromium', 'firefox', 'nwjs', 'electron', 'safari' ],

            DISABLE_PRESENCE_STATUS: true,
            DISABLE_JOIN_LEAVE_NOTIFICATIONS: true,
            DISABLE_RINGING: false,
            DISABLE_TRANSCRIPTION_SUBTITLES: false,

            RECENT_LIST_ENABLED: false,
            REMOTE_THUMBNAIL_RATIO: 1, # 1:1
            VIDEO_QUALITY_LABEL_DISABLED: true,
            CONNECTION_INDICATOR_AUTO_HIDE_ENABLED: false,
            CONNECTION_INDICATOR_AUTO_HIDE_TIMEOUT: 5000,
            CONNECTION_INDICATOR_DISABLED: true,

            SHOW_CHROME_EXTENSION_BANNER: false,
            SUPPORT_URL: "https:# www.agil-verwirklichen.de/virtueller-klassenraum/dokumentation",
            MOBILE_APP_PROMO: false,
            # MOBILE_DOWNLOAD_LINK_ANDROID: 'https://play.google.com/store/apps/details?id=org.jitsi.meet',
            # MOBILE_DOWNLOAD_LINK_F_DROID: 'https://f-droid.org/en/packages/org.jitsi.meet/',
            # MOBILE_DOWNLOAD_LINK_IOS: 'https://itunes.apple.com/us/app/jitsi-meet/id1165103905',

            MAXIMUM_ZOOMING_COEFFICIENT: 1.3,

            # /**
            # * A UX mode where the last screen share participant is automatically
            # * pinned. Valid values are the string "remote-only" so remote participants
            # * get pinned but not local, otherwise any truthy value for all participants,
            # * and any falsy value to disable the feature.
            # *
            # * Note: this mode is experimental and subject to breakage.
            # */
            AUTO_PIN_LATEST_SCREEN_SHARE: 'remote-only',
            SHOW_BRAND_WATERMARK: false,
            # BRAND_WATERMARK_LINK: '',
            # JITSI_WATERMARK_LINK: 'https://jitsi.org',
            # CLOSE_PAGE_GUEST_HINT: false, # A html text to be shown to guests on the close page, false disables it

            # /**
            # * Specify Firebase dynamic link properties for the mobile apps.
            # */
            # // MOBILE_DYNAMIC_LINK: {
            # //    APN: 'org.jitsi.meet',
            # //    APP_CODE: 'w2atb',
            # //    CUSTOM_DOMAIN: undefined,
            # //    IBI: 'com.atlassian.JitsiMeet.ios',
            # //    ISI: '1165103905'
            # // },

            # APP_SCHEME: 'org.jitsi.meet',
            # ANDROID_APP_PACKAGE: 'org.jitsi.meet',
            # ENFORCE_NOTIFICATION_AUTO_DISMISS_TIMEOUT: 15000,
            
            # // List of undocumented settings
            # /**
            # INDICATOR_FONT_SIZES
            # PHONE_NUMBER_REGEX
            # */

            # // Allow all above example options to include a trailing comma and
            # // prevent fear when commenting out the last value.
            # // eslint-disable-next-line sort-keys
            # makeJsonParserHappy: 'even if last key had a trailing comma'

            # // No configuration value should follow this line.
          },
          configOverwrite: {
            #  https:# github.com/jitsi/jitsi-meet/blob/master/config.js
            hosts: {
              #  XMPP domain.
              domain: "meet.agil-verwirklichen.de",

              #  When using authentication, domain for guest users.
              #  anonymousdomain: 'guest.example.com',

              #  Domain for authenticated users. Defaults to <domain>.
              #  authdomain: 'jitsi-meet.example.com',

              #  Jirecon recording component domain.
              #  jirecon: 'jirecon.jitsi-meet.example.com',

              #  Call control component (Jigasi).
              #  call_control: 'callcontrol.jitsi-meet.example.com',

              #  Focus component domain. Defaults to focus.<domain>.
              #  focus: 'focus.jitsi-meet.example.com',

              #  XMPP MUC domain. FIXME: use XEP-0030 to discover it.
              muc: "conference.meet.agil-verwirklichen.de",
            },

            #  BOSH URL. FIXME: use XEP-0156 to discover it.
            # bosh: '# jitsi-meet.example.com/http-bind',

            #  Websocket URL
            #  websocket: 'wss:# jitsi-meet.example.com/xmpp-websocket',

            #  The name of client node advertised in XEP-0115 'c' stanza
            # clientNode: 'http:# jitsi.org/jitsimeet',

            #  The real JID of focus participant - can be overridden here
            #  focusUserJid: 'focus@auth.jitsi-meet.example.com',

            #  Testing / experimental features.
            #

            testing: {
              #  P2P test mode disables automatic switching to P2P when there are 2
              #  participants in the conference.
              p2pTestMode: false,

            #  Enables the test specific features consumed by jitsi-meet-torture
            #  testMode: false

            #  Disables the auto-play behavior of *all* newly created video element.
            #  This is useful when the client runs on a host with limited resources.
            #  noAutoPlayVideo: false
            },

            #  Disables ICE/UDP by filtering out local and remote UDP candidates in
            #  signalling.
            #  webrtcIceUdpDisable: false,

            #  Disables ICE/TCP by filtering out local and remote TCP candidates in
            #  signalling.
            #  webrtcIceTcpDisable: false,

            #  Media
            #

            #  Audio

            #  Disable measuring of audio levels.
            disableAudioLevels: true,
            #  audioLevelsInterval: 200,

            #  Enabling this will run the lib-jitsi-meet no audio detection module which
            #  will notify the user if the current selected microphone has no audio
            #  input and will suggest another valid device if one is present.
            enableNoAudioDetection: true,

            #  Enabling this will run the lib-jitsi-meet noise detection module which will
            #  notify the user if there is noise, other than voice, coming from the current
            #  selected microphone. The purpose it to let the user know that the input could
            #  be potentially unpleasant for other meeting participants.
            enableNoisyMicDetection: true,

            #  Start the conference in audio only mode (no video is being received nor
            #  sent).
            #  startAudioOnly: false,

            #  Every participant after the Nth will start audio muted.
            #  startAudioMuted: 10,

            #  Start calls with audio muted. Unlike the option above, this one is only
            #  applied locally. FIXME: having these 2 options is confusing.
            startWithAudioMuted: true,

            #  Enabling it (with #params) will disable local audio output of remote
            #  participants and to enable it back a reload is needed.
            #  startSilent: false

            #  Video

            #  Sets the preferred resolution (height) for local video. Defaults to 720.
            #  resolution: 720,

            #  w3c spec-compliant video constraints to use for video capture. Currently
            #  used by browsers that return true from lib-jitsi-meet's
            #  util#browser#usesNewGumFlow. The constraints are independent from
            #  this config's resolution value. Defaults to requesting an ideal
            #  resolution of 720p.

            constraints: {
              video: {
                height: {
                  ideal: 320,
                  max: 480,
                  min: 240,
                },
              },
            },

            #  Enable / disable simulcast support.
            #  disableSimulcast: false,

            #  Enable / disable layer suspension.  If enabled, endpoints whose HD
            #  layers are not in use will be suspended (no longer sent) until they
            #  are requested again.
            #  enableLayerSuspension: false,

            #  Every participant after the Nth will start video muted.
            #  startVideoMuted: 10,

            #  Start calls with video muted. Unlike the option above, this one is only
            #  applied locally. FIXME: having these 2 options is confusing.
            #  startWithVideoMuted: false,

            #  If set to true, prefer to use the H.264 video codec (if supported).
            #  Note that it's not recommended to do this because simulcast is not
            #  supported when  using H.264. For 1-to-1 calls this setting is enabled by
            #  default and can be toggled in the p2p section.
            #  preferH264: true,

            #  If set to true, disable H.264 video codec by stripping it out of the
            #  SDP.
            #  disableH264: false,

            #  Desktop sharing

            #  The ID of the jidesha extension for Chrome.
            desktopSharingChromeExtId: nil,

            #  Whether desktop sharing should be disabled on Chrome.
            #  desktopSharingChromeDisabled: false,

            #  The media sources to use when using screen sharing with the Chrome
            #  extension.
            desktopSharingChromeSources: ["screen", "window", "tab"],

            #  Required version of Chrome extension
            desktopSharingChromeMinExtVersion: "0.1",

            #  Whether desktop sharing should be disabled on Firefox.
            #  desktopSharingFirefoxDisabled: false,

            #  Optional desktop sharing frame rate options. Default value: min:5, max:5.
            #  desktopSharingFrameRate: {
            #      min: 5,
            #      max: 5
            #  },

            #  Try to start calls with screen-sharing instead of camera video.
            #  startScreenSharing: false,

            #  Recording

            #  Whether to enable file recording or not.
            #  fileRecordingsEnabled: false,
            #  Enable the dropbox integration.
            #  dropbox: {
            #      appKey: '<APP_KEY>' #  Specify your app key here.
            #      #  A URL to redirect the user to, after authenticating
            #      #  by default uses:
            #      #  'https:# jitsi-meet.example.com/static/oauth.html'
            #      redirectURI:
            #           'https:# jitsi-meet.example.com/subfolder/static/oauth.html'
            #  },
            #  When integrations like dropbox are enabled only that will be shown,
            #  by enabling fileRecordingsServiceEnabled, we show both the integrations
            #  and the generic recording service (its configuration and storage type
            #  depends on jibri configuration)
            #  fileRecordingsServiceEnabled: false,
            #  Whether to show the possibility to share file recording with other people
            #  (e.g. meeting participants), based on the actual implementation
            #  on the backend.
            #  fileRecordingsServiceSharingEnabled: false,

            #  Whether to enable live streaming or not.
            liveStreamingEnabled: false,

            #  Transcription (in interface_config,
            #  subtitles and buttons can be configured)
            #  transcribingEnabled: false,

            #  Enables automatic turning on captions when recording is started
            #  autoCaptionOnRecord: false,

            #  Misc

            #  Default value for the channel "last N" attribute. -1 for unlimited.
            channelLastN: -1,

            #  Disables or enables RTX (RFC 4588) (defaults to false).
            #  disableRtx: false,

            #  Disables or enables TCC (the default is in Jicofo and set to true)
            #  (draft-holmer-rmcat-transport-wide-cc-extensions-01). This setting
            #  affects congestion control, it practically enables send-side bandwidth
            #  estimations.
            #  enableTcc: true,

            #  Disables or enables REMB (the default is in Jicofo and set to false)
            #  (draft-alvestrand-rmcat-remb-03). This setting affects congestion
            #  control, it practically enables recv-side bandwidth estimations. When
            #  both TCC and REMB are enabled, TCC takes precedence. When both are
            #  disabled, then bandwidth estimations are disabled.
            #  enableRemb: false,

            #  Defines the minimum number of participants to start a call (the default
            #  is set in Jicofo and set to 2).
            #  minParticipants: 2,

            #  Use XEP-0215 to fetch STUN and TURN servers.
            #  useStunTurn: true,

            #  Enable IPv6 support.
            #  useIPv6: true,

            #  Enables / disables a data communication channel with the Videobridge.
            #  Values can be 'datachannel', 'websocket', true (treat it as
            #  'datachannel'), undefined (treat it as 'datachannel') and false (don't
            #  open any channel).
            #  openBridgeChannel: true,

            #  UI
            #

            #  Use display name as XMPP nickname.
            #  useNicks: false,

            #  Require users to always specify a display name.
            #  requireDisplayName: true,

            #  Whether to use a welcome page or not. In case it's false a random room
            #  will be joined when no room is specified.
            enableWelcomePage: false,

            #  Enabling the close page will ignore the welcome page redirection when
            #  a call is hangup.
            #  enableClosePage: false,

            #  Disable hiding of remote thumbnails when in a 1-on-1 conference call.
            #  disable1On1Mode: false,

            #  Default language for the user interface.
            defaultLanguage: "de",

            #  If true all users without a token will be considered guests and all users
            #  with token will be considered non-guests. Only guests will be allowed to
            #  edit their profile.
            enableUserRolesBasedOnToken: false,

            #  Whether or not some features are checked based on token.
            #  enableFeaturesBasedOnToken: false,

            #  Enable lock room for all moderators, even when userRolesBasedOnToken is enabled and participants are guests.
            #  lockRoomGuestEnabled: false,

            #  When enabled the password used for locking a room is restricted to up to the number of digits specified
            #  roomPasswordNumberOfDigits: 10,
            #  default: roomPasswordNumberOfDigits: false,

            #  Message to show the users. Example: 'The service will be down for
            #  maintenance at 01:00 AM GMT,
            #  noticeMessage: '',

            #  Enables calendar integration, depends on googleApiApplicationClientID
            #  and microsoftApiApplicationClientID
            enableCalendarIntegration: false,

            #  Stats
            #

            #  Whether to enable stats collection or not in the TraceablePeerConnection.
            #  This can be useful for debugging purposes (post-processing/analysis of
            #  the webrtc stats) as it is done in the jitsi-meet-torture bandwidth
            #  estimation tests.
            gatherStats: false,

            #  The interval at which PeerConnection.getStats() is called. Defaults to 10000
            #  pcStatsInterval: 10000,

            #  To enable sending statistics to callstats.io you must provide the
            #  Application ID and Secret.
            #  callStatsID: '',
            #  callStatsSecret: '',

            #  enables sending participants display name to callstats
            enableDisplayNameInStats: false,

            #  enables sending participants email if available to callstats and other analytics
            enableEmailInStats: false,

            #  Privacy
            #

            #  If third party requests are disabled, no other server will be contacted.
            #  This means avatars will be locally generated and callstats integration
            #  will not function.
            disableThirdPartyRequests: true,

            #  Peer-To-Peer mode: used (if enabled) when there are just 2 participants.
            #

            p2p: {
              #  Enables peer to peer mode. When enabled the system will try to
              #  establish a direct connection when there are exactly 2 participants
              #  in the room. If that succeeds the conference will stop sending data
              #  through the JVB and use the peer to peer connection instead. When a
              #  3rd participant joins the conference will be moved back to the JVB
              #  connection.
              enabled: true,

              #  Use XEP-0215 to fetch STUN and TURN servers.
              #  useStunTurn: true,

              #  The STUN servers that will be used in the peer to peer connections
              #  stunServers: [

              #      #  { urls: 'stun:jitsi-meet.example.com:4446' },
              #      { urls: 'stun:meet-jit-si-turnrelay.jitsi.net:443' }
              #  ],

              #  Sets the ICE transport policy for the p2p connection. At the time
              #  of this writing the list of possible values are 'all' and 'relay',
              #  but that is subject to change in the future. The enum is defined in
              #  the WebRTC standard:
              #  https:# www.w3.org/TR/webrtc/#rtcicetransportpolicy-enum.
              #  If not set, the effective value is 'all'.
              #  iceTransportPolicy: 'all',

              #  If set to true, it will prefer to use H.264 for P2P calls (if H.264
              #  is supported).
              preferH264: true,

            #  If set to true, disable H.264 video codec by stripping it out of the
            #  SDP.
            #  disableH264: false,

            #  How long we're going to wait, before going back to P2P after the 3rd
            #  participant has left the conference (to filter out page reload).
            #  backToP2PDelay: 5
            },

            analytics: {
 #  The Google Analytics Tracking ID:
                           #  googleAnalyticsTrackingId: 'your-tracking-id-UA-123456-1'
              
             #  The Amplitude APP Key:
                           #  amplitudeAPPKey: '<APP_KEY>'
              
             #  Array of script URLs to load as lib-jitsi-meet "analytics handlers".
                           #  scriptURLs: [
                           #       "libs/analytics-ga.min.js", #  google-analytics
                           #       "https:# example.com/my-custom-analytics.js"
                           #  ],
              },

            #  Information about the jitsi-meet instance we are connecting to, including
            #  the user region as seen by the server.
            deploymentInfo: {
 #  shard: "shard1",
                           #  region: "europe",
                           #  userRegion: "asia"
              },

            #  Decides whether the start/stop recording audio notifications should play on record.
            #  disableRecordAudioNotification: false,

            #  Information for the chrome extension banner
            #  chromeExtensionBanner: {
            #      #  The chrome extension to be installed address
            #      url: 'https:# chrome.google.com/webstore/detail/jitsi-meetings/kglhbbefdnlheedjiejgomgmfplipfeb',

            #      #  Extensions info which allows checking if they are installed or not
            #      chromeExtensionsInfo: [
            #          {
            #              id: 'kglhbbefdnlheedjiejgomgmfplipfeb',
            #              path: 'jitsi-logo-48x48.png'
            #          }
            #      ]
            #  },

            #  Local Recording
            #

            #  localRecording: {
            #  Enables local recording.
            #  Additionally, 'localrecording' (all lowercase) needs to be added to
            #  TOOLBAR_BUTTONS in interface_config.js for the Local Recording
            #  button to show up on the toolbar.
            #
            #      enabled: true,
            #

            #  The recording format, can be one of 'ogg', 'flac' or 'wav'.
            #      format: 'flac'
            #

            #  },

            #  Options related to end-to-end (participant to participant) ping.
            #  e2eping: {
            #    #  The interval in milliseconds at which pings will be sent.
            #    #  Defaults to 10000, set to <= 0 to disable.
            #    pingInterval: 10000,
            #
            #    #  The interval in milliseconds at which analytics events
            #    #  with the measured RTT will be sent. Defaults to 60000, set
            #    #  to <= 0 to disable.
            #    analyticsInterval: 60000,
            #    },

            #  If set, will attempt to use the provided video input device label when
            #  triggering a screenshare, instead of proceeding through the normal flow
            #  for obtaining a desktop stream.
            #  NOTE: This option is experimental and is currently intended for internal
            #  use only.
            #  _desktopSharingSourceDevice: 'sample-id-or-label',

            #  If true, any checks to handoff to another application will be prevented
            #  and instead the app will continue to display in the current browser.
            #  disableDeepLinking: false,

            #  A property to disable the right click context menu for localVideo
            #  the menu has option to flip the locally seen video for local presentations
            disableLocalVideoFlip: false,

            #  Disables all invite functions from the app (share, invite, dial out...etc)
            disableInviteFunctions: true,

            #  Disables storing the room name to the recents list
            doNotStoreRoom: true,

            #  Options related to the remote participant menu.
            #  remoteVideoMenu: {
            #      #  If set to true the 'Kick out' button will be disabled.
            #      disableKick: true
            #  },

            #  If set to true all muting operations of remote participants will be disabled.
            #  disableRemoteMute: true,

            #  List of undocumented settings used in jitsi-meet
            #  _immediateReloadThreshold
            #  autoRecord
            #  autoRecordToken
            #  debug
            #  debugAudioLevels
            #  deploymentInfo
            #  dialInConfCodeUrl
            #  dialInNumbersUrl
            #  dialOutAuthUrl
            #  dialOutCodesUrl
            #  disableRemoteControl
            #  displayJids
            #  etherpad_base
            #  externalConnectUrl
            #  firefox_fake_device
            #  googleApiApplicationClientID
            #  iAmRecorder
            #  iAmSipGateway
            #  microsoftApiApplicationClientID
            #  peopleSearchQueryTypes
            #  peopleSearchUrl
            #  requireDisplayName
            #  tokenAuthUrl

            #  List of undocumented settings used in lib-jitsi-meet
            #  _peerConnStatusOutOfLastNTimeout
            #  _peerConnStatusRtcMuteTimeout
            #  abTesting
            #  avgRtpStatsN
            #  callStatsConfIDNamespace
            #  callStatsCustomScriptUrl
            #  desktopSharingSources
            #  disableAEC

            disableAGC: true,
            disableHPF: true,
            disableNS: true,
            enableLipSync: true,

          #  disableAP
          #  disableHPF
          #  disableNS
          #  enableLipSync

          #  forceJVB121Ratio
          #  hiddenDomain
          #  ignoreStartMuted
          #  nick
          #  startBitrate
          },
        },
      }
    end
  end
end
