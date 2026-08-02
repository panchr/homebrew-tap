cask "espresso" do
  version "0.1"
  sha256 "d068f9f1366479cf2cdf04d0bf8f8acdcd73ceb8debbff09b3ea4276d441ba77"

  url "https://github.com/panchr/espresso/releases/download/v#{version}/Espresso.zip"
  name "Espresso"
  desc "Menubar utility that prevents idle and display sleep"
  homepage "https://github.com/panchr/espresso"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Espresso.app"

  # Espresso is ad-hoc signed rather than notarized, so Gatekeeper would block
  # the copy Homebrew quarantines on download.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Espresso.app"]
  end

  uninstall quit: "com.panchr.Espresso"

  zap trash: [
    "~/Library/Preferences/com.panchr.Espresso.plist",
    "~/Library/Saved Application State/com.panchr.Espresso.savedState",
  ]

  caveats <<~EOS
    Espresso is ad-hoc signed rather than notarized, so this cask clears the
    quarantine flag after installing. Removing the app leaves a stale entry
    behind if you enabled Start at Login; clear it in
    System Settings > General > Login Items.
  EOS
end
