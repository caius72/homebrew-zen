cask "zen-safari" do
  version "1.0.0"
  sha256 "fdc61391f27598e361917881e472d3deef434973973dec19576e20b17b795813"

  url "https://github.com/caius72/zen/releases/download/v#{version}/Zen-#{version}.zip"
  name "Zen"
  desc "Zen mode for Safari: hides ads, promotions and cookie overlays"
  homepage "https://github.com/caius72/zen"

  depends_on macos: :tahoe

  app "Zen.app"

  uninstall quit: "com.tuschner.zen"

  zap trash: [
    "~/Library/Containers/com.tuschner.zen",
    "~/Library/Containers/com.tuschner.zen.Extension",
  ]

  caveats <<~EOS
    Enable Zen in Safari > Settings > Extensions and allow it on every website.
    If Zen is not listed there, open Zen.app once from /Applications.
    Then open the Zen popup, pick a provider under Connection and paste its API key.
  EOS
end
