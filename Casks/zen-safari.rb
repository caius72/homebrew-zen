cask "zen-safari" do
  version "1.0.0"
  sha256 "0cea9d5f821e646e47444ae0acef66425a1f8b795e4d909fb7e58e824329dd0a"

  url "https://github.com/caius72/zen/releases/download/v#{version}/Zen-#{version}.zip"
  name "Zen"
  desc "Zen mode for Safari: hides ads, promotions and cookie overlays with AI-reviewed rules"
  homepage "https://github.com/caius72/zen"

  depends_on macos: ">= :tahoe"

  app "Zen.app"

  # Launching the app once registers the Safari extension with macOS.
  postflight do
    system_command "/usr/bin/open", args: ["-a", "#{appdir}/Zen.app"]
  end

  uninstall quit: "com.tuschner.zen"

  zap trash: [
    "~/Library/Containers/com.tuschner.zen",
    "~/Library/Containers/com.tuschner.zen.Extension",
  ]

  caveats <<~EOS
    Enable Zen in Safari > Settings > Extensions and allow it on every website.
    Then open the Zen popup, pick a provider under Connection and paste its API key.
  EOS
end
